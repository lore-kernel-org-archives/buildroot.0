From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jan 2018 00:53:39 +0100
Subject: [Buildroot] [PATCH v2] package/bash: add /bin/bash to
 /etc/shells
In-Reply-To: <20180113161220.GG3226@scaer>
References: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
 <20180113161220.GG3226@scaer>
Message-ID: <8c2a6cb6-7993-b05f-144f-82986cf2b913@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-01-18 17:12, Yann E. MORIN wrote:
> Romain, All,
> 
> On 2018-01-13 17:05 +0100, Romain Naour spake thusly:
>> When bash is selected, /bin/bash is not added to /etc/shells
>> (see man shells). So, login tools like dropbear reject the ssh
>> connexions for users using bash as shell in /etc/passwd.
>>
>> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
>>
>> Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Really? The guy who wrote the script that checks that no two packages can touch
the same file acks this change?

[snip]
>> +	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
>> +		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells

 So this is a nice example of a package breaking top-level parallel build.

 I guess the solution is to collect the shells in a make variable and create
/etc/shells in a finalize hook. Or alternatively, do this in a finalize hook
instead of target-install hook.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
