From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 May 2013 21:03:22 +0200
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <20130523174630.0c7efe41@skate>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
 <20130523165601.5fc0fe15@skate>
 <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
 <20130523174630.0c7efe41@skate>
Message-ID: <519E67FA.8060608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/13 17:46, Thomas Petazzoni wrote:
> Dear Arn R,
>
> On Fri, 24 May 2013 01:30:14 +1000, Arn R wrote:
>> Hi Thomas,
>>
>> On Fri, May 24, 2013 at 12:56 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Well, we have a fuzzy boundary on how to handle this, we've
>>> discussed that not long ago with Arnout.
[snip]
>>> Which problem are you seeing with the
>>> current situation (i.e, without your patch) ?
>>
>> There is no serious problem, this is more a matter of
>> micro-management :) For example, I don't use the Qt binding (even
>> though Qt is present in my build) so I simply do not want it present
>> in the filesystem. My gps module is connected to a plain UART port
>> (but I use BlueZ for another bluetooth device), so I have no need for
>> the Bluetooth or USB gps support. Since GPSd provided explicit
>> options to enable/disable these very features I thought I may as well
>> provide access to those options.

  If enabling the option adds a significant amount of overhead (typically 
rootfs size overhead but it could also be performance overhead), then it 
is definitely worthwhile to make it an option. So for the qt bindings 
it's probably not worthwhile (qt itself is much larger). But for the 
Bluetooth or USB support, it could make a difference.

>
> I see, thanks for your feedback on this use case.
>
> We have two options here:
>
>   1) Either declare that adding such options would add too many options
>      to all the packages, and that such special modifications should be
>      left to local modifications.
>
>   2) Or add many more configuration options to packages.
>
> Maybe (2) is what makes sense here. The cost of new options in terms of
> maintenance is not so high,

  You forgot about updating the 'depends on' statements when a suboption 
wants to select e.g. glib...

> so maybe that's what we should do. I don't know.

  My dream is that the whole Config.in could be generated from the .mk 
file... but I'm not sure if that is really realistic. OpenWRT does it but 
it doesn't look that great either.

  So I think we'll stick to

    3) Decide on a case-by-case basis whether to go for suboptions or 
automatic enable/disable.


  Regards,
  Arnout

> Peter, Arnout?
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
