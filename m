From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Mar 2019 09:54:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <CADYdroPtCdrKHQ=BoO7uJYAYJM0V9yg3RZC_jQMNA8KPHy0-Vg@mail.gmail.com>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
 <20190306163054.5918-2-norbert.lange@andritz.com>
 <d136d1c9-caf5-4db5-aeb5-6273c4a6438a@mind.be>
 <CADYdroPtCdrKHQ=BoO7uJYAYJM0V9yg3RZC_jQMNA8KPHy0-Vg@mail.gmail.com>
Message-ID: <b1ca4bae-caea-d6b7-701d-28394c9ae1c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/03/2019 20:43, Norbert Lange wrote:
> Am So., 10. M?rz 2019 um 16:20 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
>>
>>  Hi Norbert,
>>
>> On 06/03/2019 17:30, Norbert Lange wrote:
>>> if both libfuse and libfuse3 are installed,
>>> make sure libfuse3 will be build first and
>>> use the auxiliary files from the newer package.
>>
>>  Which files are those?
> 
> Everything except the libfuse DSO itself, see
> https://github.com/libfuse/libfuse/blob/master/ChangeLog.rst#libfuse-300-2016-12-08

 Quoting that page:

e.g. /etc/fuse.conf, the udev and init scripts, and the mount.fuse(8) manpage

 Please mention these explicitly in the commit message. Indeed, our current
libfuse package doesn't install any of those.

>>  You could also verify if the packages that currently use libfuse can also use
>> libfuse3: curlftpfs e2fsprogs exfat gvfs libostree lua-flu ntfs-3g openvmtools
>> owfs sshfs unionfs xenomai. If many of them can also work with libfuse3, it
>> might be worth making a virtual package out of it.
> 
> They most certainly wont, V2 and V3 are not forward compatible.

 Absolutely not - it's like the qt4 to qt5 transition, or python2 to python3.
Many packages will take steps to support both options for some time.

[snip]
>>> +     ln -sf fusermount3 $(TARGET_DIR)/usr/bin/fusermount
>>
>>  Ah, here it is :-)
>>
>>  Why do you need to make this symlink?
> 
> I dont need to make this link, but this helper tool *is backwards compatible*,
> so it makes no sense to provide version.

 OK, understood. Could you add this explanation to the commit message?


 Regards,
 Arnout

> And fusermount is the "interface" for end users/scripts, those
> typically dont care
> for which DSO the filesystem depends on.
> (debian has the same solution)
> 
> Norbert
> 
