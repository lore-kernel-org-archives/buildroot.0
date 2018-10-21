From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 00:19:46 +0100
Subject: [Buildroot] [PATCH 2/3] package: linuxptp: enhance systemd service
In-Reply-To: <c63fff97-491b-8d5a-fb99-095e3fa08423@jikos.cz>
References: <1517155221-19399-1-git-send-email-brain@jikos.cz>
 <1517155221-19399-2-git-send-email-brain@jikos.cz>
 <20180130230054.6cb2551a@windsurf.home>
 <c63fff97-491b-8d5a-fb99-095e3fa08423@jikos.cz>
Message-ID: <eaee0d92-ef95-f48d-05eb-04124c459ef3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 30/01/2018 22:19, Petr Kulhavy wrote:
> Hi Thomas,
>
> The Before= and Wants=? time-sync.target is what I found in the systemd
> documentation. A time synchronization service should pull in this special
> target, so that applications needing time synchronization can depend on it.
> Other time synchronizing services like ntpd or systemd-timesyncd use the same
> mechanism.

?I double-checked this and confirm. So I've extended the commit log a little and
applied to master, thanks.

?Sorry that it took so long...


?Regards,
?Arnout


> Cheers
> Petr
>
> On 30/01/18 23:00, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun, 28 Jan 2018 17:00:20 +0100, Petr Kulhavy wrote:
>>> linuxptp now pulls in the time-sync.target
>>> phc2sys (linuxptp-system-clock.service) starts after ptp4l (linuxptp.service)
>>>
>>> Signed-off-by: Petr Kulhavy <brain@jikos.cz>
>>> ---
>>> ? package/linuxptp/linuxptp-system-clock.service | 2 +-
>>> ? package/linuxptp/linuxptp.service????????????? | 2 ++
>>> ? 2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/linuxptp/linuxptp-system-clock.service
>>> b/package/linuxptp/linuxptp-system-clock.service
>>> index 7327254..a4436a3 100644
>>> --- a/package/linuxptp/linuxptp-system-clock.service
>>> +++ b/package/linuxptp/linuxptp-system-clock.service
>>> @@ -1,6 +1,6 @@
>>> ? [Unit]
>>> ? Description=Precision Time Protocol system clock synchronization
>>> -After=syslog.target network.target
>>> +After=linuxptp.service
>>> ? ? [Service]
>>> ? ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
>>> diff --git a/package/linuxptp/linuxptp.service
>>> b/package/linuxptp/linuxptp.service
>>> index f690430..14e9814 100644
>>> --- a/package/linuxptp/linuxptp.service
>>> +++ b/package/linuxptp/linuxptp.service
>>> @@ -1,6 +1,8 @@
>>> ? [Unit]
>>> ? Description=Precision Time Protocol daemon
>>> ? After=syslog.target network.target
>>> +Before=time-sync.target
>>> +Wants=time-sync.target
>>> ? Wants=linuxptp-system-clock.service
>>> ? ? [Service]
>> I'm not knowledgeable enough in systemd stuff to decide on this one.
>> Anyone with more systemd knowledge ?
>>
>> Thomas
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
