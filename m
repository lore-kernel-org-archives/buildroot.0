From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Oct 2017 15:39:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcpprestsdk: new package
In-Reply-To: <20171017230652.0f8b95f4@windsurf.home>
References: <20171017205308.28529-1-Adamduskett@outlook.com>
 <20171017230652.0f8b95f4@windsurf.home>
Message-ID: <d2fba7a3-6d14-a6b2-1498-0ccef1d5c3a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-17 23:06, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 17 Oct 2017 16:53:08 -0400, Adam Duskett wrote:
> 
>> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
> 
> Meh:
> 
> package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
> package/libressl/Config.in:1:	symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL
> package/openssl/Config.in:1:error: recursive dependency detected!
> package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
> package/libressl/Config.in:1:	symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL

 Solved by inverting the select:

	select BR2_PACKAGE_LIBRESSL if !BR2_PACKAGE_OPENSSL

 But since we probably want to use openssl by default, not libressl, we should
perhaps instead invert the condition in the openssl/libressl packages. I.e.,
remove the depends from libressl, and add 'depends on !libressl' to openssl.

 Or, of course, introduce the virtual package. So I've added that as a topic for
the developer meeting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
