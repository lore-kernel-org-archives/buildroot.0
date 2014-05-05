From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 11:50:28 +0200
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <1399011251516-68708.post@n4.nabble.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
 <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
 <1398968712814-68658.post@n4.nabble.com>
 <3e06667e-ebb4-4571-9f34-dd559a37fb0e@email.android.com>
 <1398975999806-68677.post@n4.nabble.com>
 <CAAXf6LWEukHG4+BX7WzsxbXYjUahxNW8A2rNk37agJBgyNS0MQ@mail.gmail.com>
 <1399011251516-68708.post@n4.nabble.com>
Message-ID: <CAAXf6LVHPk1ARCsEwb7+DZwEsFozpAg-JEd_pqY=VDz5-4wp0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brian,

On Fri, May 2, 2014 at 8:14 AM, brianclements <brian@brianclements.net> wrote:
> On Thu, May 1, 2014 at 10:26 PM, brianclements &lt;brian@&gt; wrote:
> [..]
>>
>>>In the menuconfig, in the toolchain menu, you can specify the toolchain
>>> type. It is set to 'Buildroot' by >default, but you can specify
>>> 'external'
>>> here. I then used the default proposed toolchain (Sourcery)
>>>
>>> So I've found the fix. Selecting the external toolchain "Sourcery" (and
>>> WOW
>>> is it much faster) with my other selections same as before of x86_64 and
>>> git, was all I needed to get git to work. So I know what I need to do now
>>> to
>>> get it to work for my uses. But I'm sure that still means there is a bug
>>> somewhere in the buildroot toolchain. I'm not sure how to go about
>>> finding
>>> it for you, but I'd be more then happy to test and reproduce things along
>>> the way for you if you desire. Let me know,
>
>>Could you send me the buildroot config you were using before?
>>I will build the exact same config this time and see if I can reproduce on
> qemu.
>
> I wasn't sure which you wanted, so I included both. Both were created with
> the command `make menuconfig` and this is with comments and whitespace
> removed.
>

I have now built a system that should be pretty much the same as the
one you mentioned.
The git clone works fine on that rootfs using qemu.

The .config is attached.
I do notice a difference in buildroot baseline: I'm running on top of
buildroot git (recent version) while you are using probably 2014.02. I
don't really think this matters though.

One relevant difference between the external toolchain and the
internal one, is the libc library. The external toolchain is using
glibc, while the internal one is uclibc.
My initial assumption was that your using docker to run this rootfs is
similar to running a rootfs directly on the host system, and that it
is not completely isolated. To be honest, I still think this could be
the case. Are you sure that no single userspace library from the host
system (in particular the c library) is used in docker?

What I suggest is that you build the system with my .config file too,
and see if it works or not in docker.
I would also suggest you try qemu using the exact same system. Setting
it up isn't hard, really.
If you're using a Debian-based system, you can simply apt-get qemu-system.
Then, from the buildroot root:
qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive
file=output/images/rootfs.ext2,if=ide -append root=/dev/sda -net
nic,model=rtl8139 -net user

In the system, login as root, run the dhcp client (udhcpc or dhcpcd),
update /etc/resolv.conf with a nameserver, e.g. 'nameserver 8.8.8.8',
and then run the git clone.

Best regards,
Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 41323 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140505/34623916/attachment-0001.obj>
