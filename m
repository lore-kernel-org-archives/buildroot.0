From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Jul 2017 21:49:40 +0200
Subject: [Buildroot] Issue with the HOST_DIR/usr -> HOST_DIR move
In-Reply-To: <20170709194408.GF3196@scaer>
References: <20170709182532.40ff2614@windsurf>
 <b1e780c2-dc90-cb52-ccff-fe04fbf2f4ee@mind.be> <20170709194408.GF3196@scaer>
Message-ID: <d912f9c1-39ad-74bd-1c95-f8d7d20b125e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-17 21:44, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-07-09 21:30 +0200, Arnout Vandecappelle spake thusly:

[snip]
>>  I'll make an explicit rule for $(HOST_DIR)/usr to solve this.

> I can totally understand the need to install in an existing directory,
> but I don;t think we should accept that there is a usr/ directory in
> there.
> 
> As far as I understand, we keep the compatibility usr/ as a symlink for
> two reasons:
> 
>   - that a host-package accidentally wants to install stuff in usr/ and
>     we missed that (e.g. for out-of-tree host-packages), but still want
>     the build to succeed,
> 
>   - that existing users' post-build/fakeroot/image scripts still work
>     without modification.
> 
> However, we do not add $(HOST_DIR)/usr/{s,}bin in the PATH, so an
> existing usr/ directory would have the potential to break when a package
> unexpectedly installs stuff therein, especially out-of-tree packages.
> And in this case, the build is broken.
> 
> So I would argue that we should only accept to use an existing directory
> if it is empty.

 I agree with your reasoning. However, it's a bit complicated to accomplish.
Since $(HOST_DIR)/usr exists already, we can't use the normal make dependency
mechanism to trigger the check. So we'd either need to FORCE it, or add another
PHONY rule just for this check.

 So I'm not sure that the added complexity is really warranted.

 I'll see if I can cook something up and add it as RFC to my series.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
