From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 29 Jul 2007 11:38:54 +0200 (CEST)
Subject: [Buildroot] [patch] slang.mk (was: something (slang?) creates
 buildroot/build_i486/staging_dir/include)
In-Reply-To: <0707290121380.8510@somehost>
References: <0707290103020.8510@somehost> <0707290121380.8510@somehost>
Message-ID: <0707291107480.8510@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Jul 2007, Cristian Ionescu-Idbohrn wrote:

> On Sun, 29 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>
> > See attachment, and that may be screwing up things.
> > See also my previous posts.
>
> Moving buildroot/build_i486/staging_dir/include away will allow libpcap,
> tcpdump, wget and which to build. Though I still have troubles building
> gawk and util-linux :(

Replying to myself :)
Yes, package/slang/slang.mk screws up things :(
Please consider applying the attached patch.

I do not know much about the buildroot backyard, but I read some
discussions about the include-dir being $(STAGING_DIR)/usr/include/
and not $(STAGING_DIR)/include/. Wouldn't it be a good idea to make that a
variable somewhere in the top makefiles, something like:

  STAGING_INCLUDE_DIR = $(STAGING_DIR)/usr/include/

and change all .mk files to use that instead? That should give one point
of control on where the header files are installed and avoid errors and
confusion.

I noticed the .mk files use `cp' rather than `install', to install various
files. Is there a good reason for that?

On my box (debian sid), these two make variables:

  INSTALL = /usr/bin/install
  RM = rm -f

are predefined. Why not use them in the make files. Top makefiles would
again be the place to control the behaviour, should there be any
compatibility concerns with various distributions.

Shouldn't the clean-targets even clean stuff that was installed under the
STAGING_DIR?


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: slang.mk.patch
Type: text/x-diff
Size: 1426 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070729/04170d0c/attachment-0001.bin 
