From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Mar 2020 12:13:24 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <20200312091530.287681-2-thomas.petazzoni@bootlin.com>
References: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
 <20200312091530.287681-2-thomas.petazzoni@bootlin.com>
Message-ID: <CAAXf6LXzTLt-eUfG8zsVRB-LNfc_jo01R9bWKDzDPH6ZLtnFMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue., 12 mar. 2020 a las 10:15, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> In very limited configurations, it is possible to have a case where no
> .files-list-staging.txt files are created. In this case:
>
>         cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
>                 $(BUILD_DIR)/packages-file-list-staging.txt
>
> becomes:
>
>         cat > \
>                 $(BUILD_DIR)/packages-file-list-staging.txt
>
> which of course makes the build hang.. forever.
>
> So we fix this by checking the list is not empty. To keep the code
> readable, we introduce an intermediate variable to store the list of
> these files.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> This is a fix, it should be backported to 2020.02.x
> ---
>  Makefile | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 074d08c04a..3fdd52c677 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -727,6 +727,10 @@ $(TARGETS_ROOTFS): target-finalize
>  # Avoid the rootfs name leaking down the dependency chain
>  target-finalize: ROOTFS=
>
> +TARGET_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt))
> +HOST_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt))
> +STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt))
> +
>  .PHONY: host-finalize
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>         @$(call MESSAGE,"Finalizing host directory")
> @@ -807,12 +811,12 @@ endif # merged /usr
>
>         touch $(TARGET_DIR)/usr
>
> -       cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list.txt)) > \
> -               $(BUILD_DIR)/packages-file-list.txt
> -       cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-host.txt)) > \
> -               $(BUILD_DIR)/packages-file-list-host.txt
> -       cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
> -               $(BUILD_DIR)/packages-file-list-staging.txt
> +       $(if $(TARGET_DIR_FILES_LISTS), \
> +               cat $(TARGET_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list.txt)
> +       $(if $(HOST_DIR_FILES_LISTS), \
> +               cat $(HOST_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-host.txt)
> +       $(if $(STAGING_DIR_FILES_LISTS), \
> +               cat $(STAGING_DIR_FILES_LISTS) > $(BUILD_DIR)/packages-file-list-staging.txt)


An alternative approach that does not require checking for empty, is
to quote the argument to cat. I.e.
cat "$(sort ...)" will not hang. It would give an error though, so
your check is actually better.

But I found two additional problems in this area:

1. packages that set FOO_SUBDIR will have their file list created in
the FOO_SUBDIR, and it is not picked up by the current '$(wildcard
$(BUILD_DIR)/*/.files-list.txt)'.  Since make does not support a '**'
as recursive wildcard, we'd need to use a find or a more clever
method.

2. Previously, the packages-file-list.txt was already available by the
time the post-build scripts are run. But with the recent changes, this
is no longer true. Moving the 'cat' lines up solves that.

For 2 I have a patch but it conflicts with the above ones, so better
to apply yours first. Alternatively I can send the entire series. Let
me know what you prefer.

Best regards,
Thomas
