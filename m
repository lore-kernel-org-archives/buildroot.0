From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 21 Feb 2011 20:54:57 +0100
Subject: [Buildroot] device_table question
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F55A176@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
	<AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F55A176@EXV1.corp.adtran.com>
Message-ID: <AANLkTinJMr11Jw87u+3wcytvM6mLpJomF9FobVyT+6Wd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,

On Mon, Feb 21, 2011 at 5:34 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:
>>
>> I tried your scenario with the following device table line:
>>
>> /dev/mybetterdev ? ? ? ? c ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 230 ? ? 0
>> ? 1 ? ? ? 1 ? ? ? 10
>>
>> which resulted in:
>>
>> crw-r----- 1 root root 230, 0 2011-02-20 10:42 /mnt/dev/mybetterdev1
>> crw-r----- 1 root root 230, 1 2011-02-20 10:42 /mnt/dev/mybetterdev2
>> crw-r----- 1 root root 230, 2 2011-02-20 10:42 /mnt/dev/mybetterdev3
>> crw-r----- 1 root root 230, 3 2011-02-20 10:42 /mnt/dev/mybetterdev4
>> crw-r----- 1 root root 230, 4 2011-02-20 10:42 /mnt/dev/mybetterdev5
>> crw-r----- 1 root root 230, 5 2011-02-20 10:42 /mnt/dev/mybetterdev6
>> crw-r----- 1 root root 230, 6 2011-02-20 10:42 /mnt/dev/mybetterdev7
>> crw-r----- 1 root root 230, 7 2011-02-20 10:42 /mnt/dev/mybetterdev8
>> crw-r----- 1 root root 230, 8 2011-02-20 10:42 /mnt/dev/mybetterdev9
>>
>> This is what you wanted, right?
>
> Crap, I feel into the same trap:
>
> /dev/mydev ? c ?666 ? 0 ? 0 ? 254 ? ?1 ? 1 ? 1 ? 24
>
> gives the following (and I didn't see that until just now):
>
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 1 Feb 18 ?2011 /dev/mydev1
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?10 Feb 18 ?2011 /dev/mydev10
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?11 Feb 18 ?2011 /dev/mydev11
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?12 Feb 18 ?2011 /dev/mydev12
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?13 Feb 18 ?2011 /dev/mydev13
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?14 Feb 18 ?2011 /dev/mydev14
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?15 Feb 18 ?2011 /dev/mydev15
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?16 Feb 18 ?2011 /dev/mydev16
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?17 Feb 18 ?2011 /dev/mydev17
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?18 Feb 18 ?2011 /dev/mydev18
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?19 Feb 18 ?2011 /dev/mydev19
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 2 Feb 18 ?2011 /dev/mydev2
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?20 Feb 18 ?2011 /dev/mydev20
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?21 Feb 18 ?2011 /dev/mydev21
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?22 Feb 18 ?2011 /dev/mydev22
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ?23 Feb 18 ?2011 /dev/mydev23
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 3 Feb 18 ?2011 /dev/mydev3
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 4 Feb 18 ?2011 /dev/mydev4
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 5 Feb 18 ?2011 /dev/mydev5
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 6 Feb 18 ?2011 /dev/mydev6
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 7 Feb 18 ?2011 /dev/mydev7
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 8 Feb 18 ?2011 /dev/mydev8
> crw-rw-rw- ? ?1 root ? ? root ? ? ?254, ? 9 Feb 18 ?2011 /dev/mydev9
>
> and my device minor numbers were wrong. ?This was the fix:
>
> /dev/mydev ? c ?666 ?0 0 254 0 1 1 25
>
> Though, I would love for someone to answer the question of "why do
> I have to request 25 device nodes to get 24?"

A quick look at the code reveals why:
http://git.buildroot.net/buildroot/tree/target/makedevs/makedevs.c?h=2010.11&id=eb0ee4509d3112d80cbb210b44fb682ba7033385#n459

for (i = start; i < count; i++) {
	sprintf(full_name_inc, "%s%d", full_name, i);
	rdev = (major << 8) + minor + (i * increment - start);
	if (mknod(full_name_inc, mode, rdev) == -1) {
		...
	}
	...
}

where start, increment and count are the three last numbers in the
device table file.
So, 'count' is not coded as a count, but rather as a maximum value - 1.

I'm not sure what the best solution would be: either to keep the code
and fix the documentation, or to fix the code based on the
documentation.

Changing 'i < count' to 'i < start + count' should fix the code.

Best regards,
Thomas
