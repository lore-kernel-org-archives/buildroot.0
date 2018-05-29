From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 10:50:30 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/nss-mdns: Fix hook from
 post-install to finalize
In-Reply-To: <1527580812-14078-1-git-send-email-vincent.prince.fr@gmail.com>
 (Vincent Prince's message of "Tue, 29 May 2018 10:00:11 +0200")
References: <87wovnv81q.fsf@dell.be.48ers.dk>
 <1527580812-14078-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <87wovm7smh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:

 > Both nss-mdns and nss-myhostname patch nsswitch.conf file
 > so it needs to be done at the final stage otherwise changes are not applied

Sorry, but that still doesn't quite explain it to me. The problem rather
seems to be that nss-mdns completely replaces the hosts: line rather
than adding mdns4 to it, so depending on ordering it may overwrite the
modifications that nss-myhostname does.

If/when we get toplevel parallel builds then we also have the issue of
parallel changes to /etc/nsswitch.conf, so the move to target-finalize
is a good thing, just not the current description.

 > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 > ---
 >  package/nss-mdns/nss-mdns.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
 > index 407b942..ee666c7 100644
 > --- a/package/nss-mdns/nss-mdns.mk
 > +++ b/package/nss-mdns/nss-mdns.mk
 > @@ -17,6 +17,6 @@ define NSS_MDNS_INSTALL_CONFIG
 >  		$(TARGET_DIR)/etc/nsswitch.conf
 >  endef
 
 > -NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
 > +NSS_MDNS_TARGET_FINALIZE_HOOKS += NSS_MDNS_INSTALL_CONFIG
 
 >  $(eval $(autotools-package))
 > -- 
 > 2.7.4


-- 
Bye, Peter Korsgaard
