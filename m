From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 12:14:09 -0400
Subject: [Buildroot] fixing libtool in buildroot
In-Reply-To: <46a136670804300825i60392054g3f1b191afef5ce95@mail.gmail.com>
References: <46a136670804300814n1fb0bb1bi796d5e1db3a82134@mail.gmail.com>
	<87a5b0800804300818w26275393x8eb43fbdec13c1e4@mail.gmail.com>
	<46a136670804300825i60392054g3f1b191afef5ce95@mail.gmail.com>
Message-ID: <46a136670804300914o6419f372yd25ac44dc475fdb6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This now becomes:

# Retrieve and unpack the archive
$(BUILD_DIR)/%/.stamp_extracted:
    $(call MESSAGE,"Extracting")
    $(Q)mkdir -p $(@D)
    $(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
    $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
# some packages have messed up permissions inside
    $(Q)chmod -R ug+rw $(@D)
# if the package uses libtool, patch it for cross-compiling in buildroot
    for i in `find $(@D) -name ltmain.sh`; do \
        toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch;
\
    done
    $(Q)touch $@
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/5f266478/attachment.htm 
