From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Apr 2016 00:32:23 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix graph-depends when run
 with python3
In-Reply-To: <1460929308-16094-1-git-send-email-s.martin49@gmail.com>
References: <1460929308-16094-1-git-send-email-s.martin49@gmail.com>
Message-ID: <57140EF7.6020808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/17/16 23:41, Samuel Martin wrote:
> Make graph-depends script opening the output file in text mode since
> only ascii characters will be written.
>
> This change fixes the following error occuring when the default host
> python interpreter is python3:
>
>    make: Entering directory '/opt/buildroot'
>    Getting targets
>    Getting dependencies for ['toolchain-external', 'toolchain', 'busybox', ...]
>    Getting dependencies for ['host-python3', 'host-pkgconf', 'host-gettext', ...]
>    Getting dependencies for ['host-libxml2', 'host-swig', 'host-m4', ...]
>    Getting version for ['toolchain-external', 'toolchain', 'busybox', ...]
>    Traceback (most recent call last):
>      File "/opt/buildroot/support/scripts/graph-depends", line 425, in <module>
>        outfile.write("digraph G {\n")
>    TypeError: a bytes-like object is required, not 'str'
>    Makefile:807: recipe for target 'graph-depends' failed
>    make[1]: *** [graph-depends] Error 1
>    Makefile:84: recipe for target '_all' failed
>    make: *** [_all] Error 2
>    make: Leaving directory '/opt/buildroot'
>
> While with python2, adding 'b' to the openning mode has no effect on
> Linux (c.f. [2]), the above error is expected with python3 (c.f. [1]).
>
> Therefore, just open the outfile in default (i.e. text) mode.
>
> [1] https://docs.python.org/3/library/functions.html#open
> [2] https://docs.python.org/2/library/functions.html#open
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   support/scripts/graph-depends | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index a00eb9d..cb00383 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -73,7 +73,7 @@ else:
>       if check_only:
>           sys.stderr.write("don't specify outfile and check-only at the same time\n")
>           sys.exit(1)
> -    outfile = open(args.outfile, "wb")
> +    outfile = open(args.outfile, "w")
>
>   if args.package is None:
>       mode = MODE_FULL
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
