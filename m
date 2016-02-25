From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Thu, 25 Feb 2016 18:29:43 -0300
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <20160225221004.26bb337b@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160225215003.5886d69d@free-electrons.com>
 <56CF6B75.10604@free-electrons.com>
 <20160225221004.26bb337b@free-electrons.com>
Message-ID: <56CF7247.2060500@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/16 18:10, Thomas Petazzoni wrote:

> Hello,
>
> On Thu, 25 Feb 2016 18:00:37 -0300, Gustavo Zacarias wrote:
>
>> This is a RFC mostly since it's not complete, although it can be
>> commited as-is it's not usable directly without tweaking the fakeroot
>> script (which isn't exposed functionality at the moment).
>> We can extend makedevs syntax/tool, but i believe it will be terribly
>> messy for scenarios where multiple XATTRs are desired, more so if we
>> eventually add ACL support to this.
>
> Agreed. On the other hand, it's somewhat annoying to have two separate
> data files / mechanisms to describe the "properties" of the
> files/directories installed in the root filesystem.
>
> Can we imagine an extension to the makedevs syntax where you could give
> some additional properties for a given file, as following lines, e.g:
>
> /usr/bin/foo f 755 0 0 - - - - -
> |XATTR blabla extended attribute
> |XATTR blabla extended attribute
> |ACL blabla ACL
>
> Or something like this?

My only concern with extending the format to multi lines is that the 
data file will likely be incompatible with previous versions of makedevs.

> Yes, if we make it part of makedevs, then having an option would be a
> bit weird, but still reasonable since this stuff is pretty advanced, so
> people who need that quite certainly know what they are doing.

I'd go for homogeneous syntax in makedevs if that's the chosen way, just 
make it skip those ops when it's not enabled.

> Right. This is IMO a good reason to make this optional. makedevs could
> have an option to accept (or not) the extended properties, and then if
> we have not enabled xattr/capability in Buildroot, this option is not
> passed, which guarantees that makedevs will bail out if an extended
> property is used.

Might be worth CCing rockwellcollins guys that are working in selinux, 
they're definitely interested in this since selinux loves xattrs.
Regards.
