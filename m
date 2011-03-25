From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 25 Mar 2011 19:21:32 -0300
Subject: [Buildroot] Missing $(PYTHON_SITE_PACKAGE_DIR) in python.mk rewrite
Message-ID: <AANLkTi=h8RcWD5ZYQbx438P1m7QuRtpFjEDREGau4sQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    I had some packages that depended on the above variable being available
in buildroot. For example pyserial (pyserial.sf.net). Could you guys add it
back? Otherwise, how should I build generate that value in my .mk files?

    Below is my makefile for pyserial.

Kind Regards,
    Thiago A. Correa

#############################################################
#
# PySerial - Serial port classes for Python
#
#############################################################
#
PYSERIAL_VERSION:=2.5
PYSERIAL_SOURCE:=pyserial-$(PYSERIAL_VERSION).tar.gz
PYSERIAL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).
dl.sourceforge.net/sourceforge/pyserial/
PYSERIAL_DIR=$(BUILD_DIR)/pyserial-$(PYSERIAL_VERSION)
PYSERIAL_CAT=$(ZCAT)

$(DL_DIR)/$(PYSERIAL_SOURCE):
    $(call DOWNLOAD,$(PYSERIAL_SITE),$(PYSERIAL_SOURCE))

$(PYSERIAL_DIR)/.unpacked: $(DL_DIR)/$(PYSERIAL_SOURCE)
    $(PYSERIAL_CAT) $(DL_DIR)/$(PYSERIAL_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
    touch $@

$(PYSERIAL_DIR)/.installed: $(PYSERIAL_DIR)/.unpacked
    cp -a $(PYSERIAL_DIR)/serial $(PYTHON_SITE_PACKAGE_DIR)
    touch $@

pyserial: $(PYSERIAL_DIR)/.installed

pyserial-clean:
    -rm -rf $(PYTHON_SITE_PACKAGE_DIR)/serial

ifeq ($(strip $(BR2_PACKAGE_PYSERIAL)),y)
TARGETS+=pyserial
endif
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110325/c01f4671/attachment.html>
