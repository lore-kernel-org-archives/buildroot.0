From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 12:02:02 +0200
Subject: [Buildroot] [patch] slang.mk (was: something (slang?)
	creates	buildroot/build_i486/staging_dir/include)
In-Reply-To: <0707291107480.8510@somehost>
References: <0707290103020.8510@somehost> <0707290121380.8510@somehost>
	<0707291107480.8510@somehost>
Message-ID: <20070730100202.GH23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 29, 2007 at 11:38:54AM +0200, Cristian Ionescu-Idbohrn wrote:
>On Sun, 29 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>
>> On Sun, 29 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>>
>> > See attachment, and that may be screwing up things.
>> > See also my previous posts.
>>
>> Moving buildroot/build_i486/staging_dir/include away will allow libpcap,
>> tcpdump, wget and which to build. Though I still have troubles building
>> gawk and util-linux :(
>
>Replying to myself :)
>Yes, package/slang/slang.mk screws up things :(

Applied as r19335. Thanks!

>I do not know much about the buildroot backyard, but I read some
>discussions about the include-dir being $(STAGING_DIR)/usr/include/
>and not $(STAGING_DIR)/include/. Wouldn't it be a good idea to make that a
>variable somewhere in the top makefiles, something like:
>
>  STAGING_INCLUDE_DIR = $(STAGING_DIR)/usr/include/
>
>and change all .mk files to use that instead? That should give one point

No, we do not need a STAGING_INCLUDE_DIR.

Every package that installs headers into $(STAGING_DIR)/include is wrong
(i.e. was not yet corrected to properly install into ../usr/include).

The libraries should be installed to the same dir (/lib vs. /usr/lib) as
on an LFS compliant host (usually into /usr/lib except some rare libs
such as libc).

>of control on where the header files are installed and avoid errors and
>confusion.
>
>I noticed the .mk files use `cp' rather than `install', to install various
>files. Is there a good reason for that?

There is no good reason, no. I'd favour to use $(INSTALL) myself,
patches welcome.
>
>On my box (debian sid), these two make variables:
>
>  INSTALL = /usr/bin/install
>  RM = rm -f
>
>are predefined. Why not use them in the make files. Top makefiles would
>again be the place to control the behaviour, should there be any
>compatibility concerns with various distributions.
>
>Shouldn't the clean-targets even clean stuff that was installed under the
>STAGING_DIR?

yes, it should. Not all packages are yet adjusted to do this. Again,
patches to fix these are welcome.

TIA,
Bernhard
