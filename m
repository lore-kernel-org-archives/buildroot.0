From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Aug 2019 09:39:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: security bump version
 to 2.9
In-Reply-To: <877e6yjp1v.fsf@dell.be.48ers.dk>
References: <20190825192843.21655-1-bernd.kuhls@t-online.de>
 <995d10a8-0c25-8911-f8b5-8b65ffd60987@mind.be>
 <877e6yjp1v.fsf@dell.be.48ers.dk>
Message-ID: <c73afac5-6fdf-d8df-b48e-1192c2730234@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/08/2019 23:06, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 25/08/2019 21:28, Bernd Kuhls wrote:
>  >> Fixes https://w1.fi/security/2019-6/
>  >> 
>  >> Release notes:
>  >> http://lists.infradead.org/pipermail/hostap/2019-April/039979.html
>  >> http://lists.infradead.org/pipermail/hostap/2019-August/040373.html
> 
>  >  In addition to fixing 2019-6, this release adds a ton of features. And we're
>  > bumping two releases here... So I don't think we can classify it as a 'security
>  > bump"...
> 
>  >  Normally we should just take the patches from https://w1.fi/security/2019-6/
>  > like we have all those other patches. However, those patches are based on 2.8
>  > while we still have 2.7, so they probably won't apply cleanly...
> 
> Indeed, that was what I initially tried when I saw the advisory.
> 
> As far as I read the advisory it is about improvements to the fixes
> addressed in 2019-1 and 2019-2, which only affects hostapd or
> wpa_supplicant built with CONFIG_SAE=y (which we don't do) or built with

 SAE is part of WPA3, so we really *should* enable it (or offer an option for
it). And I'm pretty sure that there will be people that have out-of-tree patches
to enable it.

 That said...

> CONFIG_EAP_PWD=y (which we do if BR2_PACKAGE_HOSTAPD_EAP /
> BR2_PACKAGE_WPA_SUPPLICANT_EAP is enabled + openssl) but then ONLY if:
> 
> EAP-pwd being enabled in the runtime configuration). Note that EAP-pwd
> server implementation in hostapd enables only a single group at the time
> (pwd_group parameter) and by default, group 19 is used. As such, this
> would be applicable only if the pwd_group parameter is set to use one of
> the groups 28-30. The EAP-pwd peer implementation wpa_supplicant,
> follows the group selected by the server and as such, it would be
> vulnerable for the case where an attacker controls the authentication
> server (e.g., through a rogue AP) if the crypto library supports groups
> 28-30.
> 
> I am not sure how popular EAP-PWD is (I have personally never used it)
> or how difficult it is to exploit after the fixes in 2019-1 / 2019-2,
> but given the risks of bumping to 2.9, my feeling is that the most
> sensible solution would be to only apply this for next.
> 
> Anybody with more wifi knowledge (Arnout?) that disagrees?

 EAP-PWD is probably not used in wifi, but it might be used in practice in
802.1X setups. But 802.1X is so rare in general that I doubt that any buildroot
user is actually using this.

 So, I would say the SAE use case is the relevant one. And for SAE, the simple
workaround is not to enable groups 28-30 in the runtime configuration.

 And I definitely agree that the 2.9 bump is too big to take in master (and
definitely LTS). So for master and LTS, I would just add a release not entry
with the workaround.

 Regards,
 Arnout
