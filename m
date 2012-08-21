From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 21 Aug 2012 21:29:43 +0300
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
In-Reply-To: <5033C059.9060603@petroprogram.com>
References: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
 <5033C059.9060603@petroprogram.com>
Message-ID: <5033D397.1010105@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.8.2012 20:07, Stefan Fr?berg kirjoitti:
> 21.8.2012 18:51, Aras Vaichas kirjoitti:
>> I was rebuilding my Buildroot when I noticed that the
>> kent.dl.sourceforge.net mirror is down and my build fails.
>>
>> I encountered this same problem the other day with crosstool-ng, and
>> soon afterwards a patch was posted:
>> http://sourceware.org/ml/crossgcc/2012-08/msg00066.html
>>
>> I looked at changing BR2_SOURCEFORGE_MIRROR but unfortunately
>> Buildroot only allows BR2_SOURCEFORGE_MIRROR to replace *part* of the
>> Sourceforge URL
>>
>> e.g. in buildroot/package/boost/boost.mk:
>> BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
>>
>> Should it be changed to:
>> http://$(BR2_SOURCEFORGE_MIRROR).sourceforge.net/sourceforge/boost
>>
>> Comments?
> Yeah, kent is definetely down.
> Checked with this:
>
> http://kent.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
>
> But this works:
>
> http://tenet.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
>
> If that South African mirror is too far away/slow  then you could change
> the BR2_SOURCEFORGE_MIRROR
> to some other, short name value from
> http://sourceforge.net/apps/trac/sourceforge/wiki/Mirrors
>
> In related note: Maybe this BR2_SOURCEFORGE_MIRROR stuff could be
> automated somehow ?
>
> Like using some mirrorselect tool (or something like that) if
> BR2_SOURCEFORGE_MIRROR is empty and picking the fastest/closest mirror.
> And if BR2_SOURCEFORGE_MIRROR is set in Config.in then use that value no
> matter what.
>
> Just thoughts....
>
> Stefan

Update:

It seems that it is possible to let sourceforge pick the right mirror
automatically with wget

I used this:

wget
http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download

and it produced something like this:

--2012-08-21 21:21:40-- 
http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download
Resolving sourceforge.net... 216.34.181.60
Connecting to sourceforge.net|216.34.181.60|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location:
http://downloads.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2?r=&ts=1345573301&use_mirror=garr
[following]
--2012-08-21 21:21:41-- 
http://downloads.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2?r=&ts=1345573301&use_mirror=garr
Resolving downloads.sourceforge.net... 216.34.181.59
Connecting to downloads.sourceforge.net|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location:
http://garr.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
[following]
--2012-08-21 21:21:41-- 
http://garr.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
Resolving garr.dl.sourceforge.net... 193.206.140.34, 2001:760:ffff:b0::34
Connecting to garr.dl.sourceforge.net|193.206.140.34|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 48499961 (46M) [application/octet-stream]
Saving to: `boost_1_49_0.tar.bz2.1'

     0K .......... .......... .......... .......... ..........  0% 3.90M 12s
    50K .......... .......... .......... .......... ..........  0%  776K 36s
   100K .......... .......... .......... .......... ..........  0%  654K 48s
   150K .......... .......... .......... .......... ..........  0%  457K 62s
   200K .......... .......... .......... .......... ..........  0%  579K 66s
   250K .......... .......... .......... .......... ..........  0%  152M 55s
   300K .......... .......... .......... .......... ..........  0%  895K 54s
   350K .......... .......... .......... .......... ..........  0%  753K 55s
   400K .......... .......... .......... .......... ..........  0%  776K 56s
   450K .......... .......... .......... .......... ..........  1%  763K 56s
   500K .......... .......... .......... .......... ..........  1%  314K 65s
   550K .......... .......... .......... .......... ..........  1% 8.01M 60s

etc....

So it seems that wget is able to pick mirror (garr in this case)
automatically.

So automatic sourceforge mirror selection should be trivial to do if all
the other sourceforge packages also follow the same syntax:
http://sourceforge.net/projects/${PACKAGE_NAME}/files/${PACKAGE_NAME}/${PACKAGE_VERSION}/${PACKAGE_FILENAME}/download


Stefan


>> regards,
>>
>> Aras Vaichas
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
