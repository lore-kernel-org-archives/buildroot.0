From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <nrubinstein@aldebaran.com>
Date: Thu, 12 Mar 2015 10:44:24 +0100
Subject: [Buildroot] [PATCH] boost: enable boost-atomic
Message-ID: <1426153464-31580-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was disabled in february 2013 by commit
e5434583badf1abf4a4620efa76452638ad9e177
because did not build correctly with ucLibc at the time.

It now builds correctly with both uClibc v0.9.33 and uClibc-ng.

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a15b849..574f51a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -50,6 +50,9 @@ config BR2_PACKAGE_BOOST_LAYOUT
 	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
 	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 
+config BR2_PACKAGE_BOOST_ATOMIC
+	bool "boost-atomic"
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7b56827..70160da 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -23,11 +23,11 @@ HOST_BOOST_FLAGS = --without-icu \
 	iostreams locale log math mpi program_options python random regex \
 	serialization signals system test thread timer wave)
 
-# atomic library compile only with upstream version, wait for next release
 # coroutine breaks on some weak toolchains and it's new for 1.54+
 # log breaks with some toolchain combinations and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = atomic coroutine log
+BOOST_WITHOUT_FLAGS = coroutine log
 
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
-- 
2.1.4


-- 




*This email and any attachment thereto are confidential and intended solely 
for the use of the individual or entity to whom they are addressed.If you 
are not the intended recipient, please be advised that disclosing, copying, 
distributing or taking any action in reliance on the contents of this email 
is strictly prohibited. In such case, please immediately advise the sender, 
and delete all copies and attachment from your system.This email shall not 
be construed and is not tantamount to an offer, an acceptance of offer, or 
an agreement by Aldebaran Robotics on any discussion or contractual 
document whatsoever. No employee or agent is authorized to represent or 
bind Aldebaran Robotics to third parties by email, or act on behalf of 
Aldebaran Robotics by email, without express written confirmation by 
Aldebaran Robotics? duly authorized representatives.*
------------------------------

*Ce message ?lectronique et ?ventuelles pi?ces jointes sont confidentiels, 
et exclusivement destin?s ? la personne ou l'entit? ? qui ils sont 
adress?s.*

*Si vous n'?tes pas le destinataire vis?, vous ?tes pri? de ne pas 
divulguer, copier, distribuer ou prendre toute d?cision sur la foi de ce 
message ?lectronique. Merci d'en aviser imm?diatement l'exp?diteur et de 
supprimer toutes les copies et ?ventuelles pi?ces jointes de votre syst?me.*

*Ce message ?lectronique n'?quivaut pas ? une offre, ? une acceptation 
d?offre, ou ? un accord d'Aldebaran Robotics sur toute discussion ou 
document contractuel quel qu?il soit, et ne peut ?tre interpr?t? comme tel. 
Aucun employ? ou agent d?Aldebaran Robotics n'est autoris? ? repr?senter ou 
? engager la soci?t? par email, ou ? agir au nom et pour le compte de la 
soci?t? par email, sans qu?une confirmation ?crite soit donn?e par le 
repr?sentant l?gal d?Aldebaran Robotics ou par toute autre personne ayant 
re?u d?l?gation de pouvoir appropri?e.*
