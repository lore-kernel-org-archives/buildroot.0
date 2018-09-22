From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 22 Sep 2018 08:47:54 -0500
Subject: [Buildroot] [PATCH 2/2] support/scripts/graph-build-time: add
 support for timeline graphing
In-Reply-To: <20180921133117.9300-3-thomas.petazzoni@bootlin.com>
References: <20180921133117.9300-1-thomas.petazzoni@bootlin.com>
 <20180921133117.9300-3-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpZxecBwrMd_o9-v8XtUxGZrYj6egngCA0V0Qw3WgrPD9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Sep 21, 2018 at 8:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit adds support for a new type of graph, showing the timeline
> of a build. It shows, with one line per package, when each of this
> package steps started/ended, and therefore allows to see the
> sequencing of the package builds.
>
> For a fully serialized build like we have today, this is not super
> useful (except to show that everything is serialized), but it becomes
> much more useful in the context of top-level parallel build.
>
> The graph-build make target is extended to also generate this new
> timeline graph.

Is there a way to remove the page boundary or split the data so larger
builds are readable?  I'm not sure of the readablility point but my
build test of ~80-100pkg target was overlapping.

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile                         |  2 ++
>  support/scripts/graph-build-time | 71 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 18afa36b28..49f1106213 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -831,6 +831,8 @@ graph-build: $(O)/build/build-time.log
>                                    --type=pie-$(t) --input=$(<) \
>                                    --output=$(GRAPHS_DIR)/build.pie-$(t).$(BR_GRAPH_OUT) \
>                                    $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
> +       ./support/scripts/graph-build-time --type=timeline --input=$(<) \
> +               --output=$(GRAPHS_DIR)/build.timeline.$(BR_GRAPH_OUT)
>
>  .PHONY: graph-depends-requirements
>  graph-depends-requirements:
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 892e08bf07..c4aa066050 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -240,6 +240,73 @@ def pkg_pie_time_per_step(data, output):
>      plt.title('Build time per step')
>      plt.savefig(output)
>
> +step_colors = {
> +    'download': 'blue',
> +    'extract': 'red',
> +    'patch': 'green',
> +    'configure': 'black',
> +    'build': 'cyan',
> +    'install-target': 'orange',
> +    'install-staging': 'yellow',
> +    'install-images': 'purple',
> +    'install-host': 'grey'
> +}
> +
> +def pkg_timeline(data, output):
> +    start = 0
> +    end = 0
> +
> +    # Find the first timestamp and the last timestamp
> +    for p in data:
> +        for k, v in p.steps_start.iteritems():
> +            if start == 0 or v < start:
> +                start = v
> +            if end < v:
> +                end = v
> +
> +    # Readjust all timestamps so that 0 is the start of the build
> +    # instead of being Epoch
> +    for p in data:
> +        for k, v in p.steps_start.iteritems():
> +            p.steps_start[k] = v - start
> +        for k, v in p.steps_end.iteritems():
> +            p.steps_end[k] = v - start
> +
> +    plt.figure()
> +
> +    i = 0
> +    labels_names = []
> +    labels_coords = []
> +    # reversing the list, because the packages build first appear last in the list
> +    for p in reversed(data):
> +        durations = []
> +        colors = []
> +        for step in steps:
> +            if not step in p.steps_start or not step in p.steps_end:
> +                continue
> +            durations.append((p.steps_start[step],
> +                              p.steps_end[step] - p.steps_start[step]))
> +            colors.append(step_colors[step])
> +        plt.broken_barh(durations, (i, 6), facecolors=colors)
> +        labels_coords.append(i + 3)
> +        labels_names.append(p.name)
> +        i += 10
> +
> +    axes = plt.gcf().gca()
> +
> +    axes.set_ylim(0, i + 10)
> +    axes.set_xlim(0, end - start)
> +    axes.set_xlabel('seconds since start')
> +    axes.set_yticks(labels_coords)
> +    axes.set_yticklabels(labels_names)
> +    axes.set_axisbelow(True)
> +    axes.grid(True, linewidth=0.2, zorder=-1)
> +
> +    plt.gcf().subplots_adjust(left=0.2)
> +
> +    plt.tick_params(axis='y', which='both', labelsize=6)
> +    plt.title('Timeline')
> +    plt.savefig(output, dpi=300)
>
>  # Parses the csv file passed on standard input and returns a list of
>  # Package objects, filed with the duration of each step and the total
> @@ -277,7 +344,7 @@ def read_data(input_file):
>
>  parser = argparse.ArgumentParser(description='Draw build time graphs')
>  parser.add_argument("--type", '-t', metavar="GRAPH_TYPE",
> -                    help="Type of graph (histogram, pie-packages, pie-steps)")
> +                    help="Type of graph (histogram, pie-packages, pie-steps, timeline)")
>  parser.add_argument("--order", '-O', metavar="GRAPH_ORDER",
>                      help="Ordering of packages: build or duration (for histogram only)")
>  parser.add_argument("--alternate-colors", '-c', action="store_true",
> @@ -307,6 +374,8 @@ elif args.type == "pie-packages":
>      pkg_pie_time_per_package(d, args.output)
>  elif args.type == "pie-steps":
>      pkg_pie_time_per_step(d, args.output)
> +elif args.type == "timeline":
> +    pkg_timeline(d, args.output)
>  else:
>      sys.stderr.write("Unknown type: %s\n" % args.type)
>      exit(1)
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
