From: cem akpolat <akpolatcem@gmail.com>
Date: Mon, 26 May 2014 12:05:59 +0200
Subject: [Buildroot] root password and dhcp
In-Reply-To: <CAMm5YqoEXvPLZmHGOT6oHwHAw_RWJ2yQZuqMnK994uBOe_dE2g@mail.gmail.com>
References: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
 <537F889A.2030907@zacarias.com.ar>
 <839C6E81-EB22-4269-A6B1-CB60169DE097@gmail.com>
 <53807151.90401@zacarias.com.ar>
 <CAMm5YqoEXvPLZmHGOT6oHwHAw_RWJ2yQZuqMnK994uBOe_dE2g@mail.gmail.com>
Message-ID: <CAMm5YqrjM7Q-xkw=_qKtLcmSV=rV6KfSv0udxFCVdVBy1ooa8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After removing dhcp-server from the configuration list, I recompiled the
whole image and tested it again. However, the problem is still there, and
shows the same error "dnsmasq: failed to bind DHCP server socket: Address
already in use ". netstat result indicates that dnsmasq listens on 53 port
as below:

# netstat -anlp | grep -w LISTEN
tcp        0      0 0.0.0.0:1194            0.0.0.0:*               LISTEN
     1493/openvpn
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN
     11794/dnsmasq
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
     1459/dropbear

That is a bit interesting. By the way, all files in the filesystem seem as
executable files, is that really normal ?


Another point that I didn't mention in the previous mails I am always
seeing "netlink: 20 bytes leftover after parsing attributes". This message
comes directly from netlink source code (
http://lxr.free-electrons.com/source/lib/nlattr.c). It seems as a bug. May
be I should open another topic for that.

Thank you,
Cem

Cem Akpolat


On Sat, May 24, 2014 at 12:29 PM, cem akpolat <akpolatcem@gmail.com> wrote:

> Hi Gustavo,
>
>
> Actually, the last sentence "My guess is you are trying both to get a
> result and this happened, and
> that you only want dnsmasq around." explains that I want to do. Therefore
> I will try to disable to dhcp/dhcp-server and than compile the source code
> again. I was thinking, it might be case that dnsmasq uses dhcp-server,
> however, in this case dhcp-server would have been a dependecy for dnsmasq.
>
> As soon as I compile and attempt to run it, I will inform you, thank you
> again.
>
> Regards.
>
> P.S: Sorry for the mailing list, I noticed yesterday, and then
> send separately another mail to the mailing list.
>
> Cem
>
>
> Cem Akpolat
>
>
> On Sat, May 24, 2014 at 12:15 PM, Gustavo Zacarias <
> gustavo at zacarias.com.ar> wrote:
>
>> On 05/23/2014 10:35 PM, cem akpolat wrote:
>>
>> >> Well, you're somewhat light on details so we're left here to guess.
>> >> One possibility is that your dnsmasq package has dhcp support disabled,
>> >> another possibility is that your wlan0 doesn't belong to a proper
>> >> subnet/hasn't got an ip address configured at all to match that range.
>> >> Again, i can just guess without some proper information.
>> >> Regards.
>> >
>> > Regarding dnsmasq configuration, I enabled the dhcp support of dnsmasq,
>> > and dnsmasq actually tries to run dhcp, but the following error arises:
>> >
>> > *dnsmasq: failed to bind DHCP server socket: Address already in use*
>> > *
>> > *
>> > At that point, I wonder is there another dhcp server running at the
>> > background? Even if  this could be the case, dnsmasq stops all dhcp
>> > server and then restart with respect to the given configurations.
>> > Apart from dhsmasq package, I added also dhcp-relay and dhcp-server
>> > which are under dhcp package. Can dhcp-server lead to the conflict in
>> > this case ?
>> >
>> > Thank you for all recommendations, they helped a lot!
>>
>> Hi.
>> Remember to copy the mailing list too, someone else might be interested
>> in the future.
>> Well, there's your problem then, you enable the dhcp package which acts
>> as a dhcp server and dnsmasq which does so as well, so you can't have
>> both doing the same job.
>> So either you just use one by unselecting the other or if you need both
>> you'll need to tell each other to not meddle with the interface the
>> other is using via configuration files (interface=xx in dnsmasq.conf,
>> for dhcp i believe you need an invocation option for that).
>> My guess is you are trying both to get a result and this happened, and
>> that you only want dnsmasq around.
>> Regards.
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/07bca079/attachment.html>
