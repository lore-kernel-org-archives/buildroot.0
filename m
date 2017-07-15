From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 15 Jul 2017 16:09:50 -0400
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20170715214809.2158c3e2@windsurf>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk> <20170715214809.2158c3e2@windsurf>
Message-ID: <CAFSsvmqO_1ghduh7prOqU3cpKDu4Kx-GH7TwdkUgdCmafNX+xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sat, Jul 15, 2017 at 3:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 15 Jul 2017 17:15:51 +0200, Peter Korsgaard wrote:
>
>>  > Note that contrary to what Adam commit log says, the size increase is
>>  > 7.5 KB.
>>
>> Hmm, 7.5KB isn't much - But fts isn't enabled by default in uClibc-nc,
>> it is a legacy BSD feature and it also isn't supported by musl.
>
> Agreed.
>
>> It is easy to enable uClibc options, but difficult to disable them again
>> later (as users of the affected packages get caught).
>>
>> Looking around, it seems we are only talking about 3 packages (if the
>> annotations are correct):
>>
>> git grep -l 'fts.h' **/Config.in
>> package/libcgroup/Config.in
>> package/libselinux/Config.in
>> package/libsemanage/Config.in
>>
>> Do we care enough for selinux users on uClibc (libcgroup seems to only
>> be an optional dependency for gst1-rtsp-server) to let all other
>> uClibc-ng users pay?
>
> I would personally say no. The driving reason for Adam was to be able
> to build the SELinux stuff. But indeed, if you're adding all the
> SELinux overhead on your system, you most likely have the filesystem
> space needed to switch to glibc.
>
Not only that, but as stated in the past, uClibc-ng is the default
toolchain for buildroot.  And as it sits, even if somebody did go in and
turn fts on in uclibc-ng, they still wouldn't be able to select the SELinux
packages.

> So I'm fine if we decide to say "no". It should hopefully increase the
> pressure on the upstream projects to move away from a legacy BSD
> interface, and use the POSIX interface instead.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
