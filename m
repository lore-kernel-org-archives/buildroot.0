From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Mar 2013 09:40:13 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130306092424.52b72106@skate>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <51359378.3010307@mind.be> <20130305195514.14ba14fd@skate>
 <5136F5C4.6070300@mind.be> <20130306092424.52b72106@skate>
Message-ID: <513700ED.2040707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/13 09:24, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 06 Mar 2013 08:52:36 +0100, Arnout Vandecappelle wrote:
>>> Also, Olivier's patch doesn't update all the packages that depend on
>>> udev so that they can either depend on the old udev, or systemd.
>>
>>    Yes, that's what Olivier's patch does: packages that depend on udev
>> will use the old udev, not the systemd udev.
>>
>>    Hm, just now I realized that that means that you get two udevs when
>> using systemd...
>
> Yeah, yes this is what I meant by "Olivier's patch doesn't update all
> the packages that depend on udev so that they can either depend on the
> old udev, or systemd."
>
>> OK, so this is not really the way to go :-(
>
> Well, it might be the way to go, but it needs a bit more work.
>
> We can make a udev-virtual package, or whatever the name, that will
> depend on the old udev or systemd.

  But I'm a bit afraid to assume that a package can work with either... 
When someone introduces a package or does a version bump, they'll 
typically test it with one udev, either the legacy one or the new one. If 
the two start to diverge, it would have to be tested with both scenarios.

  With other virtual packages (jpeg, lua, ...), the projects make sure 
that there is compatibility. In the case of udev, it is the intention not 
to stay compatible... And the incompatibility will often be run-time 
(dbus bindings, for instance).

  So I guess the only real way forward is to replace udev with eudev. 
Then the virtual package concept is feasible.


  For the time being, however, I would say that all the current users of 
udev should depend on !BR2_PACKAGE_SYSTEMD.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
