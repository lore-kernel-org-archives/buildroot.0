From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Sep 2013 14:06:03 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
	rule idempotent
In-Reply-To: <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVbiVcBk4NR+imk=RUjVicuga5gARDmc1u-cDvf=a+v=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The $(BUILD_DIR)/.root rule is executed as part of the 'dirs'
> target. The 'dirs' target is re-executed at every execution of 'make
> external-deps', and make external-deps explicitly tells make to ignore
> targets that have already been made (through the -B option). This
> means that the $(BUILD_DIR)/.root rule has to be idempotant, which was
> not the case this the introduction of the lib32/lib64 symbolic
> link.
>
> Running 'make external-deps' three times in a row was sufficient to
> trigger an error due to symbolic links being incorrectly created. This
> patch fixes that.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This should probably be taken for 2013.08.1 as a fix of 'make
> external-deps'.
> ---
>  Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 09faeba..93fc6ea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,9 +447,13 @@ $(BUILD_DIR)/.root:
>                 --exclude .hg --exclude=CVS --exclude '*~' \
>                 $(TARGET_SKELETON)/ $(TARGET_DIR)/
>         cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> -       @ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
> -       @mkdir -p $(TARGET_DIR)/usr
> -       @ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> +       $(Q)if [ ! -L $(TARGET_DIR)/$(LIB_SYMLINK) ]; then \
> +               ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK) ; \
> +       fi
> +       $(Q)mkdir -p $(TARGET_DIR)/usr
> +       $(Q)if [ ! -L $(TARGET_DIR)/usr/$(LIB_SYMLINK) ]; then \
> +               ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK) ; \
> +       fi
>         touch $@
>
>  $(TARGET_DIR): $(BUILD_DIR)/.root
> --


Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>


Thomas, there is a patch in patchwork that renames the
$(BUILD_DIR)/.root stamp file, by J?r?me.
Although it is not directly related to the above, could you have a look at it?
http://patchwork.ozlabs.org/patch/265680/

Thanks,
Thomas
