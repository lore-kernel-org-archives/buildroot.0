From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 21:29:37 +0200
Subject: [Buildroot] [PATCH v3] asciidoc: use absolute path for resources
In-Reply-To: <CANQCQpaa6-Mv9arRxE0ijmzQUVCFga0=jpoPUspQinnXERi7kQ@mail.gmail.com>
References: <1469642568-26660-1-git-send-email-matthew.weber@rockwellcollins.com>
 <877fc6yji1.fsf@dell.be.48ers.dk>
 <CANQCQpaa6-Mv9arRxE0ijmzQUVCFga0=jpoPUspQinnXERi7kQ@mail.gmail.com>
Message-ID: <20160728192937.GB5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2016-07-28 08:04 -0500, Matthew Weber spake thusly:
> On Wed, Jul 27, 2016 at 2:21 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
> >  > From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> >  > One of the "features" of a2x is that the '-r|--resource' flag imports
> >  > resources relative to the [SOURCE_FILE], not the CWD. The current
> >  > implementation tries to import resources from the destination dir $(@D),
> >  > which works fine for out-of-tree builds because $(@D) is an absolute
> >  > path, however in-tree builds treat $(@D) as a relative path, which breaks
> >  > because a2x treats $(@D) relative to SOURCE_FILE.
[--SNIP--]
> > Like Yann, I also cannot reproduce any errors without it. How do you
> > trigger it?
> You can see the issue by running "make V=1 manual". Normally you'll
> see the following
> 
> ...
> >>>   Generating split HTML manual...
> mkdir -p output/docs/manual
> a2x  --xsltproc-opts "--stringparam toc.section.depth 1" -f chunked -d
> book -L -r /home/foobar/projects/asciidoc-upstream/buildroot-main/docs/images
> -r output/docs/manual  --destination-dir="output/docs/manual"
> --asciidoc-opts=""
> /home/foobar/projects/asciidoc-upstream/buildroot-main/output/build/docs/manual/manual.txt
> 
> The issue is with the flag "-r output/docs/manual" which uses a
> relative path. However only generated files are stored there, which
> isn't a problem with the current Buildroot as it doesn't use any. The
> issue appears when you use generated files like a graphviz element
> because the generated graph is stored in that directory.
> 
> You can recreate the bug by applying this patch
> 
> From: Brandon Maier <brandon.maier@rockwellcollins.com>
> Date: Wed, 27 Jul 2016 17:05:43 -0500
> Subject: [PATCH] Example graph to show asciidoc bug
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
>  docs/manual/introduction.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
> index 476aa81..2297efd 100644
> --- a/docs/manual/introduction.txt
> +++ b/docs/manual/introduction.txt
> @@ -24,3 +24,20 @@ comes with default configurations for several
> boards available
>  off-the-shelf. Besides this, a number of third-party projects are based on,
>  or develop their BSP footnote:[BSP: Board Support Package] or
>  SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
> +
> +["graphviz", "sample2.png"]
> +---------------------------------------------------------------------
> +digraph automata_0 {
> +  size ="8.5, 11";
> +  node [shape = circle];
> +  0 [ style = filled, color=lightgrey ];
> +  2 [ shape = doublecircle ];
> +  0 -> 2 [ label = "a " ];
> +  0 -> 1 [ label = "other " ];
> +  1 -> 2 [ label = "a " ];
> +  1 -> 1 [ label = "other " ];
> +  2 -> 2 [ label = "a " ];
> +  2 -> 1 [ label = "other " ];
> +  "Machine: a" [ shape = plaintext ];
> +}
> +---------------------------------------------------------------------

Thanks for this example. However, the generated manual does include the
graph of that state machine.

    $ git checkout 9d4a1a7^  # 9d4a1a7 is your commit
    $ make manual-html
    [--SNIP--]
    $ ls -l output/docs/manual/sample2.png docs/manual/sample2.png
    ls: cannot access 'docs/manual/sample2.png': No such file or directory
    -rw-r--r-- 1 ymorin ymorin 17K Jul 28 21:25 output/docs/manual/sample2.png
    $ mkdir ../O
    $ make O=$(cd ../O; pwd) manual-html
    [--SNIP--]
    $ ls -l ../O/docs/manual/sample2.png docs/manual/sample2.png
    ls: cannot access 'docs/manual/sample2.png': No such file or directory
    -rw-r--r-- 1 ymorin ymorin 16512 Jul 28 21:26 ../O/docs/manual/sample2.png

Both in-tree and out-of-tree manuals have the state machine, and the
graph *is* generated in the output dir, not the source dir.

Did I miss something?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
