From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 13 Jul 2007 14:04:15 +0200
Subject: [Buildroot] Install to /lib usr /usr/lib ?
In-Reply-To: <f0528b5b0707120848w682852a7i24137288712a53ae@mail.gmail.com>
References: <f0528b5b0707120848w682852a7i24137288712a53ae@mail.gmail.com>
Message-ID: <20070713120414.GA32559@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 12, 2007 at 05:48:30PM +0200, Julien Letessier wrote:
>Dear buildroot maintainers,
>
>For the relative newcomer I am, there seems to be a lot of
>inconsistency in buildroot for package installation directories.
>
>>From what I undrestand, the policy is to install packages:
>* under $(STAGING_DIR)/{bin,lib,include} and $(STAGING_DIR)/{bin,lib}
>for the toolchain (e.g. uclibc)

No, this is not correct.
Everything that goes to $(STAGING_DIR)/include is wrong, it should be in
$(STAGING_DIR)/usr/include

Most of the packages should install into $(STAGING_DIR)/usr, a few
exceptions are allowed to go to $(STAGING_DIR)/lib (uClibc et al, refer
to your host for examples).

>* under $(STAGING_DIR)/usr/{bin,lib,include} and
>$(STAGING_DIR)/usr/{bin,lib} for other packages (e.g. gtk)
>
>Is this correct?

The scheme that is supposed to be used is to match a usual host as close
as possible. Some packages put their *.a into /usr/lib while they put
their *.so into /lib. Following this for the staging_dir is ok iff your
host hints it.
>
>If so, we have a problem.
>Half the of the package/*/*.mk use one option, half use the other.

The consistency is relatively new, alot of packages still do install
into $(STAGING_DIR) directly and have to be fixed to install into
$(STAGING_DIR)/usr. I corrected some already, patches to fix the rest
are very welcome.

>As I "svn uped" today, the fontconfig package I had a hard time
>patching broke, because expat decided AGAIN to install directly under
>/lib.
>
>Please, please establish a clear policy on this, so we can start
>submiting patches
