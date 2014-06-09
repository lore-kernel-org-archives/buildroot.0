From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 00:02:41 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140609220241.GK3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-07 23:46 +0200, Thomas Petazzoni spake thusly:
> This patch adds a global instrumentation hook that collects the list
> of files installed in $(TARGET_DIR) by each package, and stores this
> list into a file called $(BUILD_DIR)/<pkgname>.filelist. It can later
> be used to determine the size contribution of each package to the
> target root filesystem.
> 
> The only limitation is that if a file is installed by a package A, and
> then overriden by a file from package B, the file will only be listed
> in $(BUILD_DIR)/A.filelist as it is the first time we will see the
> file.

If we really wanted to account for the realy package, we'd have to
somehow notice that a pacakge did change the content of a file.

So, we would need to run sha1sum on all the files in the pre-step and
the post step. Any differing line would mean a new file, or a changed
file.

See below for a proposed storage solution.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5116ed9..069653e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -55,6 +55,30 @@ define step_time
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  
> +# Package size steps
> +define step_pkg_size_start
> +	echo "PKG SIZE START $(1)"
> +	(cd $(TARGET_DIR) ; find . -type f) | sort > \
> +		$(BUILD_DIR)/$(1).tmp_filelist_before

At first, I wondered if we should not store those files in the packages'
own build directory (along with the .stamp files.)

But then I went back to thinking about the second-package-to-install-a-file
issue raised in the commit log.

So, say we are able to determine what files a pacakge installs or modify
(using the sah1, for example.) Then we could just store that list in a
single file, that gets appended to package after package, and which
format would be:

package-name <TAB> path/to/file
package-name <TAB> path/to/other/file
other-package <TAB> path/to/third/file
pther-package <TAB> path/to/file             <-- override

That way, the python script has only one file to scan, which is sorted
by build-order, and the script can detect overwritten files, and even
report that, while still accounting the size to the real pacakge that
installed the file that will end up in the target.

Of course, using sha1 would slow the build quite a bit.

Thoughts?

Regards,
Yann E. MORIN.

> +endef
> +
> +define step_pkg_size_end
> +	echo "PKG SIZE END $(1)"
> +	(cd $(TARGET_DIR); find . -type f) | sort > \
> +		$(BUILD_DIR)/$(1).tmp_filelist_after
> +	diff -u $(BUILD_DIR)/$(1).tmp_filelist_before $(BUILD_DIR)/$(1).tmp_filelist_after | \
> +		grep '^\+\./' | sed 's%^\+%%' > $(BUILD_DIR)/$(1).filelist
> +	$(RM) -f $(BUILD_DIR)/$(1).tmp_filelist_before \
> +		$(BUILD_DIR)/$(1).tmp_filelist_after
> +endef
> +
> +define step_pkg_size
> +	$(if $(filter install-target,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
> +
>  # User-supplied script
>  define step_user
>  	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
