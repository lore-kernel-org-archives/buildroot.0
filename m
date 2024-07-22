Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D94C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BBB40930;
	Mon, 22 Jul 2024 12:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkmVzuCETkTF; Mon, 22 Jul 2024 12:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D32A408C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D32A408C3;
	Mon, 22 Jul 2024 12:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 009251BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC5E80556
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay_yXeYCYF8w for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E6D8054A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E6D8054A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1351B86FCB; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:10:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f463a4953534df13397ce113bfbbc03d4b8e4df7
X-Git-Newrev: 758b424582afdad7e7adc2b1ff06e06db7a1296f
X-Patchwork-Hint: ignore
Message-Id: <20240722121030.1351B86FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: disable octave
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=758b424582afdad7e7adc2b1ff06e06db7a1296f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable octave support which was added in commit
fab48302865e5c0c98d91b696bc90e75e38189bb but untested as octave is not
installed to staging and raises the following build failure:

sparc64-linux-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/octave-3.8.1'

Fixing those issues is useless, as gtkiostream is not compatible with
latest octave version as it raises a bunch of errors:

Octave.C: In member function 'void Octave::startOctave(const std::vector<std::__cxx11::basic_string<char> >&)':
Octave.C:85:5: error: 'octave_main' was not declared in this scope; did you mean 'octave_map'?
   85 |     octave_main((int)argsIn.size(), (char**)&argsIn[0], embedded);
      |     ^~~~~~~~~~~
      |     octave_map
Octave.C: In member function 'int Octave::setGlobalVariable(const std::string&, Matrix&)':
Octave.C:283:50: error: use of deleted function 'octave::symbol_table::symbol_table()'
  283 |             octave_value ov=octave::symbol_table().global_varval(string(baseName));
      |                                                  ^
In file included from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/octave-config.h:99,
                 from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/parse.h:29,
                 from Octave.C:18:
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C:284:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
  284 |             octave::symbol_table().global_assign (string(baseName), setGlobalSubVariable(varNames, m, 0, ov));
      |                                  ^
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C:286:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
  286 |             octave::symbol_table().global_assign (string(baseName), m);
      |                                  ^
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C: In member function 'octave_map Octave::setGlobalSubVariable(const std::vector<std::__cxx11::basic_string<char> >&, const Matrix&, int, octave_value&)':
Octave.C:302:38: error: 'class string_vector' has no member named 'lookup'
  302 |             whichIdx=base.map_keys().lookup(varNames[index+1]); // map_keys returns a string_vector
      |                                      ^~~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/9cfc420a4e41503635792472176583a8f81bb2a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/gtkiostream.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index 970644d6df..bc3d859d4e 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -19,16 +19,10 @@ GTKIOSTREAM_DEPENDENCIES = \
 	host-pkgconf
 
 GTKIOSTREAM_CONF_OPTS = \
+	--disable-octave \
 	--disable-tests \
 	$(if $(BR2_TOOLCHAIN_HAS_OPENMP),--disable,--enable)-openmp
 
-ifeq ($(BR2_PACKAGE_OCTAVE),y)
-GTKIOSTREAM_DEPENDENCIES += octave
-GTKIOSTREAM_CONF_OPTS += --enable-octave
-else
-GTKIOSTREAM_CONF_OPTS += --disable-octave
-endif
-
 # For the optional packages below, there's unfortunately no
 # ./configure option to explicitly enable/disable them. They are
 # checked by the ./configure script using pkg-config.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
