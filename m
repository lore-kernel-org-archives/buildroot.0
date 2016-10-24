From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Oct 2016 16:52:52 +0200
Subject: [Buildroot] [PATCH 1/2] sudo: Add ldap support for sudoers rules
In-Reply-To: <7b9bf544-b035-0b55-c70f-5bc07cb98e14@cdf123.net>
References: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
 <ffe77538-4bad-a040-c0e3-fd745270a849@mind.be>
 <7b9bf544-b035-0b55-c70f-5bc07cb98e14@cdf123.net>
Message-ID: <c23e73df-3b0c-c052-31d4-e3a8b3257168@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-16 16:10, Chris Frederick wrote:
> Hi Arnout,
> 
> Comments below...
> 
> On 10/21/16 14:13, Arnout Vandecappelle wrote:
>> >  Hi Chris,
>> > 
>> >  Thank you for your patch. I have a few comments below. Can you fix and
>> > resubmit? I have marked your patch as "Changes Requested" in our patch tracking
>> > system so if you don't resubmit we will forget about it.
>> > 
>> > On 19-10-16 18:08, Chris Frederick wrote:
>>> >> Added Config.in options to enable/disable the option, and check options
>>> >> in sudo.mk to add openldap as a dependancy and compile with --with-ldap.
>>> >>
>>> >> Signed-off-by: Chris Frederick <cdf123@cdf123.net>
>>> >> ---
>>> >>  package/sudo/Config.in | 12 ++++++++++++
>>> >>  package/sudo/sudo.mk   |  5 +++++
>>> >>  2 files changed, 17 insertions(+)
>>> >>
>>> >> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
>>> >> index cbef15d..2e9e35a 100644
>>> >> --- a/package/sudo/Config.in
>>> >> +++ b/package/sudo/Config.in
>>> >> @@ -9,3 +9,15 @@ config BR2_PACKAGE_SUDO
>>> >>  	  but still allow people to get their work done.
>>> >>  
>>> >>  	  http://www.sudo.ws/sudo/
>>> >> +
>>> >> +if BR2_PACKAGE_SUDO && BR2_PACKAGE_OPENLDAP
>>> >> +config BR2_PACKAGE_SUDO_LDAP
>> > 
>> >  As far as I know, there is no need to make this option configurable. Just
>> > enable LDAP support when BR2_PACKASGE_OPENLDAP is selected, like you do for
>> > postgresql.
> From my experience with sudo built with ldap, it stops checking /etc/sudoers for rules and instead looks for /etc/ldap.conf.  According to the
> link in the help text, /etc/sudoers is only read for defaults, everything else needs to come from ldap.  And if /etc/ldap.conf hasn't been
> configured by the user, sudo will fail with a "no valid sudoers sources found" error.  So I wanted to make sure a user explicitly selected the
> option.  That's just been my experience using this in buildroot and gentoo.  I should probably add that to the help.
> 
> How about this:
> 
> help:
>   Allows you to manage sudoers rules in a centralized ldap
>   directory.  This restricts the /etc/sudoers file from
>   defining rules, only defaults will be read. All rules will
>   need to be provided via ldap configured in /etc/ldap.conf
> 
>   http://www.sudo.ws/man/1.8.15/sudoers.ldap.man.html

 OK, then indeed it's better to make it an option.

 One small coding style nit: write it like:

if BR2_PACKAGE_SUDO
config BR2_PACKAGE_SUDO_LDAP
	depends on BR2_PACKAGE_OPENLDAP

so future sudo extensions can reuse the same conditions - not likely, but htis
is the pattern that we follow everywhere else.

 Normally we would use 'select' instead of 'depends on', but in this case
'depends' is indeed better.

 Please also summarise the above in the commit message. And you can add the
following to the commit message too:

Since the user explicitly has to provide /etc/ldap.conf, we use 'depends on' so
that the user is obliged to explicitly enable openldap before the option becomes
visible.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
