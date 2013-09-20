From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Sep 2013 18:39:51 +0200
Subject: [Buildroot] [PATCH v4 2/3] pkg-generic: fix rules for top-level
 parallel make
In-Reply-To: <CAHkwnC_bSPoD34dsdXGJ=5toeRXDZ=SsikhTbeQsbzSyqLfmjQ@mail.gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-3-git-send-email-fabio.porcedda@gmail.com>
 <20130917202343.3b714fad@skate>
 <CAHkwnC-pwVUF0=7Og_XucpTPfJDNut9oXk=Y5oxQm1otHMzNRg@mail.gmail.com>
 <20130919213943.44f7a215@skate>
 <CAHkwnC_bSPoD34dsdXGJ=5toeRXDZ=SsikhTbeQsbzSyqLfmjQ@mail.gmail.com>
Message-ID: <523C7A57.9030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/13 16:44, Fabio Porcedda wrote:
>>>> Why is $$($(2)_TARGET_PATCH) an order-only dependency? Why isn't the
>>>> >> >configure -> patch dependency handled like all the others, using stamp
>>>> >> >files dependencies?
>>> >>
>>> >>I'm using an order-only dependency just to use a single line, i can
>>> >>splt both rules:
>>> >>
>>> >>$$($(2)_TARGET_CONFIGURE):   | $$($(2)_DEPENDENCIES)
>>> >>
>>> >>ifeq
>>> >>...
>>> >>$$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_PATCH)
>>> >>...
>>> >>else
>>> >>...
>>> >>$$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_RSYNC)
>>> >>...
>>> >>endif
>>> >>
>>> >>Do you like it?
>> >
>> >I think it would be clearer. Also, it should be same for the other
>> >dependencies between steps. Rather than putting them in the
>> >$(BUILD_DIR)/%/.stamp_<something> rules, you could put them in the
>> >$$($(2)_TARGET_<SOMETHING>) rules so that they are all at the same
>> >place, no?
> It's fine for me, in the previous version (v3) i was doing that, I
> hope is fine even for Arnout.


  Ah yes, I didn't consider the rsync thing. In fact you're right, by 
putting the dependencies in the pattern rules you loose a lot of 
flexibility. So, back to the version you propose above!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
