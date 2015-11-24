From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Nov 2015 23:30:10 +0100
Subject: [Buildroot] Overriding Buildroot packages
In-Reply-To: <CAPER3A0tE2_edxtE65MaVUVUh3BOdqywb4jUANOe_4Jm+0fihw@mail.gmail.com>
References: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
 <20151124164107.3570084a@free-electrons.com>
 <CAPER3A0tE2_edxtE65MaVUVUh3BOdqywb4jUANOe_4Jm+0fihw@mail.gmail.com>
Message-ID: <5654E4F2.2020405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-11-15 19:27, Hajime Branko Yamasaki Vukelic wrote:
> Hi Thomas,
> 
> On Tue, Nov 24, 2015 at 4:41 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> [SNIP]
> 
>> Are you able to give more details about which specific package you need
>> to override and why? It would be useful for us to understand such use
>> cases, and see if there is a different solution/option, or if the use
>> case is really too specific.
> 
> I have a need to ship postgresql 9.5 beta instead of the stable 9.4.5.
> Current solution is to create a postgres-95 package and modify
> dependencies accordingly. Fortunately, this is currently just one
> package, so it wasn't a big issue. Another package was bottle, on
> which we gave up as not critical.

 If the only thing you need to change is to use a different version, what I like
to do is to use OVERRIDE_SRCDIR instead of relying on the buildroot version. I
have a local.mk with:

# Create an automatic OVERRIDE for everything under src/
AUTO_OVERRIDES = $(notdir $(wildcard $(BR2_EXTERNAL)/src/*)))
do_override = $(1)_OVERRIDE_SRCDIR = $(BR2_EXTERNAL)/src/$(2)
$(foreach override,$(AUTO_OVERRIDES),\
        $(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))


(this snippet is licensed GPLv2+).


 The limitation of this approach is that you can't easily override other details
of the packaging, in particular the dependencies can't be overridden.

> 
> Ideally, ability to override some aspect of an existing package (e.g.,
> only its version, or only the source URL, or something along those
> lines) would be great to have. If not, then, a mechanism to make two
> packages equivalent (something like virtual packages but applicaable
> to packages that are not explicitly virtual) would also work (e.g.,
> `POSTGRES_95_PROVIDES = postgres`, that causes having postgres-95
> selected to satisfy dependency requirement for a package that
> selects/depends on postgres).

 There is a fairly easy way to make it possible to override the version and
dependencies, but I think it's a bit ugly. In inner-generic-package, instead of
defining all the rules directly, we could add yet another level of direction and
delay the definition of the rules until after BR2_EXTERNAL has been included.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
