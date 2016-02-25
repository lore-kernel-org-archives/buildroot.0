From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:10:04 +0100
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <56CF6B75.10604@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160225215003.5886d69d@free-electrons.com>
 <56CF6B75.10604@free-electrons.com>
Message-ID: <20160225221004.26bb337b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 18:00:37 -0300, Gustavo Zacarias wrote:

> This is a RFC mostly since it's not complete, although it can be 
> commited as-is it's not usable directly without tweaking the fakeroot 
> script (which isn't exposed functionality at the moment).
> We can extend makedevs syntax/tool, but i believe it will be terribly 
> messy for scenarios where multiple XATTRs are desired, more so if we 
> eventually add ACL support to this.

Agreed. On the other hand, it's somewhat annoying to have two separate
data files / mechanisms to describe the "properties" of the
files/directories installed in the root filesystem.

Can we imagine an extension to the makedevs syntax where you could give
some additional properties for a given file, as following lines, e.g:

/usr/bin/foo f 755 0 0 - - - - -
|XATTR blabla extended attribute
|XATTR blabla extended attribute
|ACL blabla ACL

Or something like this?

> Well, i was hoping for feedback, let's see other opinions.
> Enabling capabilities/xattrs/acls might be an option in target 
> filesystem where people can then add the respective file(s) describing 
> them, hence making it optional. If it were in makedevs it could be an 
> option as well but would pollute things quite a bit.

Yes, if we make it part of makedevs, then having an option would be a
bit weird, but still reasonable since this stuff is pretty advanced, so
people who need that quite certainly know what they are doing.

> Might be worth adding tar acl/xattr support as well, rigth now squashfs 
> and maybe ubifs are the only filesystem targets enabled for this.

Right. This is IMO a good reason to make this optional. makedevs could
have an option to accept (or not) the extended properties, and then if
we have not enabled xattr/capability in Buildroot, this option is not
passed, which guarantees that makedevs will bail out if an extended
property is used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
