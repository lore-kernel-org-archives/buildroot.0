From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 5 Jul 2015 11:26:27 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <20150705110141.17803801@free-electrons.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <CAHkwnC8yDfpiXyKLFxZHUOA-TT+4xtoHLW32NM03WAb2Yyjq6g@mail.gmail.com>
 <20150705110141.17803801@free-electrons.com>
Message-ID: <CAHkwnC8rFVs8f2Kc5bGYatvt8n9bxuHUod=3JhJftkacEucgNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 5, 2015 at 11:01 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 5 Jul 2015 10:51:56 +0200, Fabio Porcedda wrote:
>
>> I've redone all the tests including the case of the patch set without
>> using top-level make.
>>
>> I've repeated the the test at least two times and taken the minimum value.
>
> How much variation did you had between the test builds for a given
> scenario? Taking the minimal value is a somewhat strange choice :)

Not very much, it was done because in some cases every time a repeat
the build the time was reduced,  i will show you the full data, build
times are sorted by their value, usually the lowest value is the last
value taken:

defconfig-small, HW-MED:
| top-level make | patch set | build time
|----------------------| ---------------|
--------------------------------------------------
| no                  | no            | 10m13s 10m16s 10m16s 10m17s
| no                  | yes          |  10m17s 10m18s 10m20s 11m23s
| yes                 | no           |   5m25s 5m27s 5m28s 5m31s
| yes                 | yes         |  5m22s 5m23s 5m24s 5m26s

defconfig-small, HW-HIGH:
| top-level make | patch set | build time
|----------------------| ---------------|
--------------------------------------------------
| no                  | no            | 21m17s 21m20s 21m42s
| no                  | yes          |  21m24s 21m25s 21m28s
| yes                 | no           |  7m57s 7m57s 7m58s 7m58s
| yes                 | yes         |   7m48s 7m50s 7m50s 7m55s 7m57s 7m58s

defconfig-full, HW-MED:
| top-level make | patch set | build time
|----------------------| ---------------|
--------------------------------------------------
| no                  | no            |  199m 199m
| no                  | yes          |   200m 200m
| yes                 | no           |  99m 101m
| yes                 | yes         |  99m 100m


defconfig-full, HW-HIGH:
| top-level make | patch set | build time
|----------------------| ---------------|
--------------------------------------------------
| no                  | no            | 350m 351m
| no                  | yes          | 355m 358m
| yes                 | no           | 74m 75m
| yes                 | yes         | 76m 76m 76m

>> defconfig-small:
>> | HW-HIGH | HW-MED | top-level make | patch set |
>> |----------------|----------------|-----------------------|---------------|
>> | 21m17s    | 10m13s   | no                  | no           |
>> | 21m24s    | 10m17s   | no                  | yes         |
>> |   7m57s    |  5m25s   | yes                 | no           |
>> |   7m48s    |  5m22s   | yes                 | yes         |
>>
>> defconfig-full:
>> | HW-HIGH | HW-MED | top-level make | patch set |
>> |----------------|----------------|-----------------------|---------------|
>> | 350m       | 199m       | no                  | no           |
>> | 355m       | 200m       | no                  | yes         |
>> |   74m       |  99m        | yes                 | no           |
>> |   76m       |  99m        | yes                 | yes         |
>>
>> In these tests the penalty of using pps is 0%-3%.
>> Also the reduction of build time using top-level make is 50%-78%
>>
>> I think they are nice numbers :)
>
> Yes, they are very good. I guess that if we implement per-package host
> dir there will be a small additional impact, but clearly the benefits
> of top-level parallel largely outweighs the impact of per-package
> staging/host directories.
>
> Thanks a lot for having done those additional tests, it clearly means
> we should progressively merge your work on this topic!

Great!

I work now to use the toolchain wrapper even for the internal toolchain.

Best regards
-- 
Fabio Porcedda
