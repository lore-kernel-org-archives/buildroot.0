From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Sep 2013 23:38:44 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
	rule idempotent
In-Reply-To: <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 5 Sep 2013 23:27:39 +0200")
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761u9wu8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The $(BUILD_DIR)/.root rule is executed as part of the 'dirs'
 Thomas> target. The 'dirs' target is re-executed at every execution of 'make
 Thomas> external-deps', and make external-deps explicitly tells make to ignore
 Thomas> targets that have already been made (through the -B option). This
 Thomas> means that the $(BUILD_DIR)/.root rule has to be idempotant, which was
 Thomas> not the case this the introduction of the lib32/lib64 symbolic
 Thomas> link.

 Thomas> Running 'make external-deps' three times in a row was sufficient to
 Thomas> trigger an error due to symbolic links being incorrectly created. This
 Thomas> patch fixes that.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas> This should probably be taken for 2013.08.1 as a fix of 'make
 Thomas> external-deps'.
 Thomas> ---
 Thomas>  Makefile | 10 +++++++---
 Thomas>  1 file changed, 7 insertions(+), 3 deletions(-)

 Thomas> diff --git a/Makefile b/Makefile
 Thomas> index 09faeba..93fc6ea 100644
 Thomas> --- a/Makefile
 Thomas> +++ b/Makefile
 Thomas> @@ -447,9 +447,13 @@ $(BUILD_DIR)/.root:
 Thomas>  		--exclude .hg --exclude=CVS --exclude '*~' \
 Thomas>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 Thomas>  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 Thomas> -	@ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
 Thomas> -	@mkdir -p $(TARGET_DIR)/usr
 Thomas> -	@ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 Thomas> +	$(Q)if [ ! -L $(TARGET_DIR)/$(LIB_SYMLINK) ]; then \
 Thomas> +		ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK) ; \

Can't you just do ln -sf like we do elsewhere?

-- 
Bye, Peter Korsgaard
