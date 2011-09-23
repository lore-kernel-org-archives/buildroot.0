From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 23 Sep 2011 08:16:09 +0200
Subject: [Buildroot] [PATCH] linux custom tarball: automatically detect
 a change in tarball configuration
In-Reply-To: <20110922215817.1bba4c82@skate>
References: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
 <20110922215817.1bba4c82@skate>
Message-ID: <CAAXf6LWbsf0WP-A_n3DkV2mdRn54CiL=3AWFckDeuF=L2-Y31A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 22, 2011 at 9:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 21 Sep 2011 10:55:54 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> When you specify a LINUX_TARBALL, the variable LINUX_VERSION will be set to
>> the fixed "custom". As a result, LINUX_DIR remains the same even though you
>> modified the .config file to specify a different tarball. ?When re-running
>> make, buildroot does not see the change because the stamp files still look
>> up-to-date, and you'll have to force building the new kernel in some way.
>>
>> This patch overwrites LINUX_VERSION to include the LINUX_TARBALL string, If a
>> new custom tarball is configured, LINUX_DIR will be different, the old stamp
>> files will not matter, and buildroot will correctly start the build process for
>> the new kernel.
>
> Sorry, but LINUX_TARBALL can be something like
> http://foobar.com/blah/blek/linux-3.11.0.tar.bz2, and I don't think
> it's a good idea to create a directory named
> linux-custom-http://foobar.com/blah/blek/linux-3.11.0.tar.bz2
>

Ai, I didn't think of that. In my case, I'm relying on the
BR2_PRIMARY_SITE to know where the tarball is at.
The directory that's created in that case would be:
linux-custom-linux-2.XXX-myproject.tar.bz2

> You could do something like:
>
> LINUX_VERSION = $(LINUX_SOURCE), in which case the directory would be:
>
> linux-linux-3.11.0.tar.bz2/ in the case highlighted above, which is not
> very nice either.

I agree that these directory names do not look very good. But they do
uniquely map a custom tarball on a directory, and cause the build
process to detect a change in tarball.
Personally, I don't mind having such a funny-looking directory in output/build.

>
> Or:
>
> LINUX_VERSION = $(firstword $(shell echo $(LINUX_TARBALL) | md5sum)
>
> which would create a hash from the LINUX_TARBALL URL, and that hash
> would change when the LINUX_TARBALL URL is changed. I don't know if
> it's nicer.

This would also do the trick, but has the downside of not being
user-readable. If a user changes from tarball, he will have two linux
directories in output/build, and no direct way of knowing which is the
old and new one (except for looking at the timestamp or calculating
the md5sum himself).

>
> I agree that their is a minor inconvenience in having the directory
> always named linux-custom/, but I don't have a good solution in mind.

The other solution that I implemented in buildroot-2010.11 is to make
the download step depend on the tarball, instead of on a stamp file.
Since linux now uses gentargets, this would require a change in the
whole of gentargets as well.
Essentially, the .stamp_downloaded file would be no longer needed, and
the tarball would serve as stamp file.

Would you prefer such a solution?

Best regards,
Thomas
