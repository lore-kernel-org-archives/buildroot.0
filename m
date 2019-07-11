From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Jul 2019 17:51:04 +0200
Subject: [Buildroot] [PATCH v2] support/script/pkg-stats: add support
 for json output
In-Reply-To: <20190711092801.6314-1-victor.huesca@bootlin.com>
References: <20190711092801.6314-1-victor.huesca@bootlin.com>
Message-ID: <20190711175104.45c6f597@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

Thanks for this work!

On Thu, 11 Jul 2019 11:28:02 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Pkg-stats is a great script that get a lot of intersting infos from

Typo: interesting

> buildroot packages. Unfortunatly it is currently designed to output a

Typo: unfortunately

> static HTML page only. While html is great for human to read, it is a
> pain to parse for scripts.
> 
> This patch provide a new option to output a JSON file in addition to the

provide -> provides

> HTML one. This allow other scripts to use all the usefull informations

allow -> allows

informations -> information

> computed by pkg-stats.
> 
> Please note that the old 'output' option has been renamed to 'html'
> to distinguish from the new 'json' option. Also the 'npackages' and
> 'packages' now uses the argparse `mutualy_exclusive` group.

uses -> use

mutually_exclusive

> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

I think ideally this patch should have been split into two:

 - One migrating the options to a better argparse usage

 - A second one adding the JSON output support itself.

> +def dump_json(packages, stats, output):
> +    excluded_fields = ['url_worker', 'name']
> +    pkgs = {
> +        pkg.name: {
> +            k: v
> +            for k, v in pkg.__dict__.items()
> +            if k not in excluded_fields
> +        } for pkg in packages
> +    }
> +    statistics = {
> +        k: v
> +        for k, v in stats.items()
> +        if not k.startswith('infra-')
> +    }
> +    statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}

Perhaps a short comment here would be useful to explain what's going on
with the "infra" key in the statistics dict.

> +    o = subprocess.check_output(['git', 'log', 'master', '-n', '1', '--pretty=format:%H'])
> +    final = {'packages': pkgs,
> +             'stats': statistics,
> +             'commit': o.splitlines()[0],
> +             'date': str(datetime.datetime.utcnow())}

For both the git commit and date, I find it a bit odd that we need to
retrieve it separately once for the HTML output and once for the JSON
output. I think it would make more sense if the calling function of
dump_html() and dump_json() was getting those two values (Git commit id
and date), and pass them as argument to dump_html() and dump_json().

Besides these comments, it looks good to me!

Thanks again,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
