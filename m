From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 14 May 2013 14:50:48 +0200
Subject: [Buildroot] legal-info too permissive?
In-Reply-To: <51921A1A.3070009@lucaceresoli.net>
References: <20130514114131.0b73cee0@skate> <51921A1A.3070009@lucaceresoli.net>
Message-ID: <51923328.6090707@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Thomas Petazzoni wrote:
>> Hello Luca,
>>
>> Looking at
>> http://autobuild.buildroot.org/results/183/183d0af8c692b8c90b5b136999a0661fc7893b3a/build-end.log, 
>>
>> one can see:
>>
>> cat: /home/test/test/2/output/build/neon-0.29.6/src/COPYING: No such 
>> file or directory
>>
>> so it seems like the neon legal informations are not correct (or no
>> longer correct). This should be fixed of course, but the thing that
>> surprises me here is that the 'make legal-info' apparently didn't
>> return with an error. So the overall build was considered successful,
>> even though some license information is obviously wrong in this neon
>> package.
>>
>> In this intentional? Shouldn't 'make legal-info' be more restrictive,
>> and bail out with an error if some license file cannot be found in the
>> source code? At least the latter would be the most useful behavior for
>> the autobuilders.
>
> This is not intentional, it is a bug in the legal-info infrastructure.
> Thanks for reporting!
>
> The problem lies in the loopthat iterates over license files:
>
> >        @for F in $$($(2)_LICENSE_FILES); do \
> >                $(call 
> legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
> >                done
>
> The loop errors out only if the last file is missing. If a preceding
> file is missing, it goes on carelessly.
>
> In the case of neon:
> > NEON_LICENSE_FILES = src/COPYING.LIB src/COPYING README
> the missing file is the second out of three.
>
> I am looking into fixing this.

I just sent a patch to fix this.

The neon package still needs to be fixed.

Luca
