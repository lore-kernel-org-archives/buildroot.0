From: Vicente Bergas <vicencb@gmail.com>
Date: Mon,  5 Oct 2015 20:41:44 +0100
Subject: [Buildroot] efl: fix framebuffer support
In-Reply-To: <5609AA80.6040106@openwide.fr>
References: <5609AA80.6040106@openwide.fr>
Message-ID: <1444074105-2110-1-git-send-email-vicencb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

> Hi Vicente,
> 
> Le 27/09/2015 02:37, vj a =C3=A9crit :
>> Hello Romain,
>> this weekend I had some time to spend on this, sorry for the delay.
> 
> That's ok, I guess you're working on your free time :)
> 
>>=20
>> I've posted the EFL issue:
>> http://sourceforge.net/p/enlightenment/mailman/message/34493376
> 
> Glad to see you had some help on your error on framebuffer support.
> If you send me a git formated patch that fixes your issue, be sure it'll =
> be part
> of the next efl series. (I hope, in the meantime, a patch will be applied
> upstream and backported to 1.15 stable branch before the 1.15.2 release).

It seems that the issue was not posted soon enough to make it for 1.15.2,
so, here is the patch required for it to work.

> 
>>=20
>> And tested your efl-1.15.1-v1 branch from
>> git://github.com/RomainNaour/buildroot.git
>> Aside from the EFL workaround (-fvisibility=3Ddefault) the only
>> remaining issue is that when audio is disabled it fails to build
>> because of bae9cf8354208bdad7780e0d11e5b4c8cf1b1f3e.
>> I think it should be safe to just revert it because multisense is
>> already enabled by default and (as an audio-related feature) it only
>> makes sense when audio is also enabled.
> 
> Thanks for the testing and the feedback!
> The last patches from efl-1.15.1-v1 branch are WIP and won't be included =
> yet in
> the next Buildroot series. I'll take a closer look to multisense stuff.

I've spotted something extra:
package/efl/efl.mk:312: *** EFL_SITE (http://download.enlightenment.org/rel/libs/efl/) cannot have a trailing slash.  Stop.
Affected packages are:
econnman efl elemines empc enlightenment libcanberra libelementary libemotion-generic-players libetrophy libevas-generic-loaders python-efl rage terminology x11r7
This fixes it:
sed -i 's@\(_SITE = .*\)/$@\1@' $(grep -rl '_SITE = .*/$')

Regards,
  Vicente.

> 
>>=20
>> Regards,
>>   Vicente.
>>=20
>> Tested-by: Vicente Bergas <vicencb@gmail.com>
>>=20
> 
> I already added your tested-by tag in the commit that bump efl for the ta=
> rget.
> https://github.com/RomainNaour/buildroot/commit/04b24bc4e9b9c21209cbdb111=
> 0d0ae41991f838d
> 
> Also, tags are not taken into account by patchwork when you reply to a co=
> ver
> letter. You can send several tags on a specific patch on the series by re=
> plying
> to the email.
> 
> Best regards,
> Romain
 
