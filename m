From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jun 2016 11:53:37 +0200
Subject: [Buildroot] [PATCH] package/quagga: Add systemd.service file
In-Reply-To: <76555fc3-8603-91d7-ad8f-ecdef822df16@gmail.com>
References: <1466874128-22828-1-git-send-email-nroach44@gmail.com>
 <91c2c2b3-7715-2ab6-31ab-144aa346c54b@mind.be>
 <76555fc3-8603-91d7-ad8f-ecdef822df16@gmail.com>
Message-ID: <49651e9d-0a96-c7de-fb8b-1ec4e21324f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Mainly improving my systemd knowledge here :-)

On 29-06-16 09:06, Nathaniel Roach wrote:
> On 27/06/16 05:09, Arnout Vandecappelle wrote:
>> On 25-06-16 19:02, Nathaniel Roach wrote:
[snip]
>>   However, since the Wants= is added for zebra, it would make sense to create the
>> zebra symlink, no?
> No, systemd will automatically start zebra when it's needed. It's not needed
> until one of the other daemons start (which systemd will start zebra beforehand
> if the daemon is local). If they are remote, the user can enable zebra themselves.

 So, if there is a Wants=quagga at zebra.service line, then systemd will look for
quagga at zebra.service in /usr/lib/systemd/services, and failing that it will
automatically try quagga at .service? Nice!

[snip]
>>> +Wants=quagga at zebra.service
>>   I just realize now: this line should probably be removed when
>> BR2_PACKAGE_QUAGGA_ZEBRA is not set.
> Also true, however that's why I said Wants= and not Requires= so systemd handles
> the lack of zebra fine.

 So in case zebra doesn't exist, systemd will still try to execute the service
file, but the ExecStart command will fail because /usr/sbin/zebra doesn't exist,
right? But in that case, won't it retry every second (Restart=on-failure) and
spam the journal horribly?

 Maybe there should be a ConditionFileIsExecutable in the [Unit] section?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
