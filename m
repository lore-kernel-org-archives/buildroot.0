From: Kleegrewe, Christian <christian.kleegrewe@siemens.com>
Date: Thu, 25 Jan 2007 10:15:12 +0100
Subject: [Buildroot] Make problems
Message-ID: <D10BFA8BB60FBC43849BFB49875965CC02D9C4@MCHP7IEA.ww002.siemens.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I tried to integrate a simple software project into the buildroot, but it does not compile. The problem is, that the compilation process is not started. The target is added correctly to TARGETS and the copying at the beginning of the hello.mk is performed correctly, but the $(MAKE) is never called. I suspect that it is a problem with the definition of the corresponding target.

Here are my Config.in

config BR2_PACKAGE_HELLO
	bool "hello"
	default y
	help
	  hello world test programm to test integration of a 
	  third party software to the buildroot

And my hello.mk File

#############################################################
#
# Any custom stuff you feel like doing....
#
#############################################################
HELLO_DIR=package/hello
HELLO_SOURCE_DIR=$(HOME)/embedded_p2p/hello
HELLO=hello
HELLO_BINARY=hello

$(HELLO):
	-cp -af $(HELLO_SOURCE_DIR)/* $(HELLO_DIR)/
	touch $@
	touch -c $(HELLO_DIR)/hello.cpp

$(HELLO_DIR)/$(HELLO_BINARY): $(HELLO_DIR)/hello.cpp $(HELLO_DIR)
	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" DEBUG=true KLIBC?lse \
	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/include \
	    TARGET_DIR=$(TARGET_DIR) -C $(HELLO_SOURCE_DIR) -o $(HELLO_BINARY);

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_HELLO)),y)
TARGETS+=hello
Endif

I tried to find a sollution for my problem in the mailing list archives, but it is difficult to search.

Any help will be appreciated

Thanks Christian
--------------------------------------8<-----------------------------------------------------

Christian Kleegrewe
CT IC 6
Fon: +49 89 636 42722
Fax: +49 89 636 41423
Mail: mailto:christian.kleegrewe@siemens.com

> Siemens Aktiengesellschaft: 
> Vorsitzender des Aufsichtsrats: Heinrich v. Pierer; 
> Vorstand: Klaus Kleinfeld, Vorsitzender; Johannes Feldmayer, Joe Kaeser, Rudi Lamprecht, Eduardo Montes, J?rgen Radomski, Erich R. Reinhardt, Hermann Requardt, Uriel J. Sharef, Klaus Wucherer
> Sitz der Gesellschaft: Berlin und M?nchen
> Registergericht: Berlin Charlottenburg, HRB 12300, M?nchen, HRB 6684
> WEEE-Reg.-Nr. DE 23691322
> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070125/2c29b208/attachment-0001.htm 
