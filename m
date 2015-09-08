From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 15:39:59 +0200
Subject: [Buildroot] [PATCH] gdb: prevent building the documentation
In-Reply-To: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55EEE52F.4020904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 15:22, Vicente Olivert Riera wrote:
> gdb needs makeinfo to build the documentation. Since we do not provide a
> host-makeinfo package this will fail in any system where makeinfo is
> missing. However, we can workaround this problem by preventing gdb to
> build the documentation.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gdb/gdb.mk |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 338de20..7a8f8c7 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -114,6 +114,12 @@ else
>  GDB_CONF_OPTS += --without-zlib
>  endif
>  
> +# Prevent gdb to build the documentation
> +define GDB_DISABLE_DOC
> +$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
> +endef
> +GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC

 Since it is patching the source, it should be POST_PATCH_HOOKS rather than
PRE_CONFIGURE_HOOKS.

 That does mean that people using OVERRIDE_SRCDIR should do this fix in the
overridden source, but I think that's OK.

 Regards,
 Arnout

> +
>  # This removes some unneeded Python scripts and XML target description
>  # files that are not useful for a normal usage of the debugger.
>  define GDB_REMOVE_UNNEEDED_FILES
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
