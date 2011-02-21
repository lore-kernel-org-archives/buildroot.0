From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 21 Feb 2011 10:34:03 -0600
Subject: [Buildroot] device_table question
In-Reply-To: <AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
	<AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F55A176@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I tried your scenario with the following device table line:
> 
> /dev/mybetterdev         c       640     0       0       230     0
>   1       1       10
> 
> which resulted in:
> 
> crw-r----- 1 root root 230, 0 2011-02-20 10:42 /mnt/dev/mybetterdev1
> crw-r----- 1 root root 230, 1 2011-02-20 10:42 /mnt/dev/mybetterdev2
> crw-r----- 1 root root 230, 2 2011-02-20 10:42 /mnt/dev/mybetterdev3
> crw-r----- 1 root root 230, 3 2011-02-20 10:42 /mnt/dev/mybetterdev4
> crw-r----- 1 root root 230, 4 2011-02-20 10:42 /mnt/dev/mybetterdev5
> crw-r----- 1 root root 230, 5 2011-02-20 10:42 /mnt/dev/mybetterdev6
> crw-r----- 1 root root 230, 6 2011-02-20 10:42 /mnt/dev/mybetterdev7
> crw-r----- 1 root root 230, 7 2011-02-20 10:42 /mnt/dev/mybetterdev8
> crw-r----- 1 root root 230, 8 2011-02-20 10:42 /mnt/dev/mybetterdev9
> 
> This is what you wanted, right?

Crap, I feel into the same trap:

/dev/mydev   c  666   0   0   254    1   1   1   24

gives the following (and I didn't see that until just now):

crw-rw-rw-    1 root     root      254,   1 Feb 18  2011 /dev/mydev1
crw-rw-rw-    1 root     root      254,  10 Feb 18  2011 /dev/mydev10
crw-rw-rw-    1 root     root      254,  11 Feb 18  2011 /dev/mydev11
crw-rw-rw-    1 root     root      254,  12 Feb 18  2011 /dev/mydev12
crw-rw-rw-    1 root     root      254,  13 Feb 18  2011 /dev/mydev13
crw-rw-rw-    1 root     root      254,  14 Feb 18  2011 /dev/mydev14
crw-rw-rw-    1 root     root      254,  15 Feb 18  2011 /dev/mydev15
crw-rw-rw-    1 root     root      254,  16 Feb 18  2011 /dev/mydev16
crw-rw-rw-    1 root     root      254,  17 Feb 18  2011 /dev/mydev17
crw-rw-rw-    1 root     root      254,  18 Feb 18  2011 /dev/mydev18
crw-rw-rw-    1 root     root      254,  19 Feb 18  2011 /dev/mydev19
crw-rw-rw-    1 root     root      254,   2 Feb 18  2011 /dev/mydev2
crw-rw-rw-    1 root     root      254,  20 Feb 18  2011 /dev/mydev20
crw-rw-rw-    1 root     root      254,  21 Feb 18  2011 /dev/mydev21
crw-rw-rw-    1 root     root      254,  22 Feb 18  2011 /dev/mydev22
crw-rw-rw-    1 root     root      254,  23 Feb 18  2011 /dev/mydev23
crw-rw-rw-    1 root     root      254,   3 Feb 18  2011 /dev/mydev3
crw-rw-rw-    1 root     root      254,   4 Feb 18  2011 /dev/mydev4
crw-rw-rw-    1 root     root      254,   5 Feb 18  2011 /dev/mydev5
crw-rw-rw-    1 root     root      254,   6 Feb 18  2011 /dev/mydev6
crw-rw-rw-    1 root     root      254,   7 Feb 18  2011 /dev/mydev7
crw-rw-rw-    1 root     root      254,   8 Feb 18  2011 /dev/mydev8
crw-rw-rw-    1 root     root      254,   9 Feb 18  2011 /dev/mydev9

and my device minor numbers were wrong.  This was the fix:

/dev/mydev   c  666  0 0 254 0 1 1 25

Though, I would love for someone to answer the question of "why do
I have to request 25 device nodes to get 24?"

The below is the way I wanted it:

crw-rw-rw- 1 root root 254,  0 2011-02-21 10:19 mydev1
crw-rw-rw- 1 root root 254,  9 2011-02-21 10:19 mydev10
crw-rw-rw- 1 root root 254, 10 2011-02-21 10:19 mydev11
crw-rw-rw- 1 root root 254, 11 2011-02-21 10:19 mydev12
crw-rw-rw- 1 root root 254, 12 2011-02-21 10:19 mydev13
crw-rw-rw- 1 root root 254, 13 2011-02-21 10:19 mydev14
crw-rw-rw- 1 root root 254, 14 2011-02-21 10:19 mydev15
crw-rw-rw- 1 root root 254, 15 2011-02-21 10:19 mydev16
crw-rw-rw- 1 root root 254, 16 2011-02-21 10:19 mydev17
crw-rw-rw- 1 root root 254, 17 2011-02-21 10:19 mydev18
crw-rw-rw- 1 root root 254, 18 2011-02-21 10:19 mydev19
crw-rw-rw- 1 root root 254,  1 2011-02-21 10:19 mydev2
crw-rw-rw- 1 root root 254, 19 2011-02-21 10:19 mydev20
crw-rw-rw- 1 root root 254, 20 2011-02-21 10:19 mydev21
crw-rw-rw- 1 root root 254, 21 2011-02-21 10:19 mydev22
crw-rw-rw- 1 root root 254, 22 2011-02-21 10:19 mydev23
crw-rw-rw- 1 root root 254, 23 2011-02-21 10:19 mydev24
crw-rw-rw- 1 root root 254,  2 2011-02-21 10:19 mydev3
crw-rw-rw- 1 root root 254,  3 2011-02-21 10:19 mydev4
crw-rw-rw- 1 root root 254,  4 2011-02-21 10:19 mydev5
crw-rw-rw- 1 root root 254,  5 2011-02-21 10:19 mydev6
crw-rw-rw- 1 root root 254,  6 2011-02-21 10:19 mydev7
crw-rw-rw- 1 root root 254,  7 2011-02-21 10:19 mydev8
crw-rw-rw- 1 root root 254,  8 2011-02-21 10:19 mydev9
 
> Note that you seem to have forgotten one field in your device table
> lines: I count only 9 fields, while you should have 10 (or is this a
> typeover mistake?)
> 
> The above was tested with Buildroot 2010.05.
> 
> Best regards,
> Thomas
