From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 19 Sep 2018 10:00:52 +0200
Subject: [Buildroot] make printvars errors / empty variables
Message-ID: <7a232c87-0b65-e04a-9cc0-590e15f6f38f@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

so during a printvars run there's stuff printed to stderr for me:

make printvars > printvars.txt
/bin/bash: support/dependencies/check-host-.sh: No such file or directory
/bin/bash: -c: line 0: syntax error near unexpected token `)'
/bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1; 
then echo ""; else echo ""; fi; rm -f "$TMP"'


These seem to be 2 issues. Here's some context for the first one where 
some appended variable doesn't seem to be expanded:

stripurischeme= 

suitable-extractor= 

/bin/bash: support/dependencies/check-host-.sh: No such file or 
directory
suitable-host-package= 

toolchain-external-package= 

MANUAL_INSTALL_STAGING = YES 

MANUAL_ADD_TOOLCHAIN_DEPENDENCY = NO


and some for the second one where an if Statement doesn't seem to be 
expanded:

toolchain_find_libc_a=$(readlink -f $(LANG=C  -print-file-name=libc.a)) 

toolchain_find_libdir=$(printf $(readlink -f $(LANG=C 
-print-file-name=libc.a)) | sed -r -e 
's:.*/(usr/)?(lib(32|64)?([^/]*)?(/[^/]*)?)/libc.a:\2:')
toolchain_find_sysroot=$(printf $(readlink -f $(LANG=C 
-print-file-name=libc.a)) | sed -r -e 
's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
/bin/bash: -c: line 0: syntax error near unexpected token `)' 

/bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1; 
then echo ""; else echo ""; fi; rm -f "$TMP"'
try-run= 

virt-provides-single=ifneq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_)),) 

$(error Configuration error: both "" and $(BR2_PACKAGE_PROVIDES_) are 
selected as providers for virtual package "". Only one provider can be 
selected at a time. Please fix your configuration)
endif 

virtual-package= 

# Ensure the virtual package has an implementation defined.


I just drop this here without further digging into it. Let me know if I 
can add anything more helpful,

thanks

                              martin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180919/de14a110/attachment.bin>
