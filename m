From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 14:45:12 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <20170403141147.0376b102@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
 <20170403130149.6ccffe4e@free-electrons.com>
 <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
 <20170403141147.0376b102@free-electrons.com>
Message-ID: <c5d92f69-e151-293b-3b77-3b2b061d0e50@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-17 14:11, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 3 Apr 2017 13:25:11 +0200, Arnout Vandecappelle wrote:
> 
>>  Would the libintl from uClibc make it easier to do static linking, i.e. is it
>> in libc or in a separate libintl library?
> 
> It is in libc I believe, since uClibc now has everything in libc. So it
> does make things a *lot* easier for static linking.

 And I guess musl also has it in a single libc? Yeah, I don't see a libintl
there so I guess it's bundled.

 If we do enable the stubs in uClibc, and a packages links with -lintl, then in
fact the full gettext will be used and the stubs are not even linked in
(statically or dynamically), correct? In that case, we could indeed enable the
stubs in uClibc. As a result, in static linking, any package that links with
gettext but forgets an explicit -lintl will use the stubs instead of the full
implementation. So the package still works, but without translations.

 So that would be an option. We should then still accept patches that add
appropriate -lintl even though it's not a build failure, but we don't have to
fix build failures due to -lintl if nobody complains about it. It's a kind of
pragmatical, imperfect solution.


 As a side note, pretty much independent of this issue: I wonder if our
BR2_NEEDS_GETTEXT_IF_LOCALE approach really is the right thing to do. It
basically says: if a package is able to use translations, we force translations
(by enabling gettext). Wouldn't it be much more appropriate to remove all those
selects from Config.in, and instead just add to _DEPENDENCIES:
$(if $(BR2_PACKAGE_GETTEXT),gettext) ? That allows the user to choose whether or
not they want translations.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
