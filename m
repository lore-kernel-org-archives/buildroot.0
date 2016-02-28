From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Feb 2016 00:41:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <1456674270.13955.11.camel@embedded.rocks>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
 <1456651515.13955.2.camel@embedded.rocks> <87y4a5p3w5.fsf@dell.be.48ers.dk>
 <1456658221.13955.7.camel@embedded.rocks> <56D30D11.3030907@mind.be>
 <1456674270.13955.11.camel@embedded.rocks>
Message-ID: <56D385A7.9050804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/16 16:44, J?rg Krause wrote:
> On So, 2016-02-28 at 16:06 +0100, Arnout Vandecappelle wrote:
>> On 02/28/16 12:17, J?rg Krause wrote:
>>>
>>> On So, 2016-02-28 at 10:42 +0100, Peter Korsgaard wrote:
>>>>>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks>
>>>>>>>>> writes:
>>>>  > On So, 2016-02-28 at 08:30 +0100, Thomas Petazzoni wrote:
>>>>  >>  
>>>>  >>      powerpc |                    czmq-v3.0.2 | NOK |
>>>>  >> http://autobuild.buildroot.net/results/2061238affb685db998100a56c6571538d089a5b/
>>>>
>>>>  > /home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libstdc++.a(compatibility-ldbl.o): In function `std::tr1::hash<long double>::operator()(long double) const':
>>>>  > compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c): undefined reference to `frexpl'
>>>>
>>>>  > I cannot reproduce it on my 64-bit host.
[snip]
> That's why I sent a patch with LIBS=-lm.

 The problem turns out to be more complicated... It's actually a problem with
libstdc++. Dependeing on the arch, some functions will be in
compatibility-ldbl.o. If you use any of these functions, that file will be
linked in. And when that file is linked in, all the _other_ functions, which you
actually don't use, are also linked in. And one of these functions is the
template function hash<long double>::operator(), which uses frexpl.

 So, requiring czmq to link with -lm is a bit weird, given that neither itself,
nor any of its dependencies really need it...

 So ideally it should be fixed in libstdc++ itself. But I have no idea how to do
that...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
