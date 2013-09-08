From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 8 Sep 2013 09:13:30 -0400
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
	rule idempotent
In-Reply-To: <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANxTyt4-UNps4mw2KRMbg9TGjj03e5eL5vczCJORuE4as4HwQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Sep 5, 2013 at 5:27 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> $(TARGET_DIR_WARNING_FILE)
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


Wouldn't just changing the "ln -s" to "ln -snf" be sufficient?  After all,
that's what is being done to make $(STAGING_DIR):

$(STAGING_DIR):
@mkdir -p $(STAGING_DIR)/bin
@mkdir -p $(STAGING_DIR)/lib
@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
@mkdir -p $(STAGING_DIR)/usr/lib
@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
   ....

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130908/df73698a/attachment-0001.html>
