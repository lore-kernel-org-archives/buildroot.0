From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Nov 2015 22:19:03 +0100
Subject: [Buildroot] [PATCH] support/dependencies: ensure we have 'file'
 on the host
In-Reply-To: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
References: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5658C8C7.4080104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-11-15 21:02, Yann E. MORIN wrote:
> When 'file' is missing on the host, libtool fails miserably. Packages
> that use libtool will suddenly FTBFS, with cryptic error messages, like
> missing libraries on the linker invocation.

 I've taken a look at an ltmain.sh and a libtool, but the only two calls to
'file' I could find were for darwin and for win32.

> 
> We could ensure that autotools based packages now all depend on
> host-file. But It itself is an autotools package, so it's again a
> chicken-n-egg issue. And even non-autotools package may use libtool.
> 
> So, just require that 'file' is present on the host.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/dependencies/dependencies.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 3146401..f14fb79 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -69,6 +69,12 @@ check_prog_host "which"
>  # Verify that sed is installed
>  check_prog_host "sed"
>  
> +# 'file' must be present, otherwise libtool fails in incomprehensible
> +# ways. For example, bandwidthd would fail to link with -lz, even

 bandwidthd doesn't even have a libtool...

 Could you give a concrete example of where libtool uses file?


 Regards,
 Arnout


> +# though the library is there (and it's not a static/shared issue).
> +# Adding the 'file' program on the system miraculously fixes the issue.
> +check_prog_host "file"
> +
>  # Check make
>  MAKE=$(which make 2> /dev/null)
>  if [ -z "$MAKE" ] ; then
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
