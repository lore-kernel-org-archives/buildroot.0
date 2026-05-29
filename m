Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEB3CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AE984A77;
	Fri, 29 May 2026 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzS7z4_FMTIM; Fri, 29 May 2026 21:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C759884A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780090722;
	bh=9aZ5H/cJaDUcoCjrK133HEOknByg85K9OhOVGN3Mkng=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UnW/060MbbLe9ScTWOsmBO1UiV7ElNvUU4L+HtaZDhHewuwFT7VllpJhRNQFCuXmt
	 6/D1Bn9/JQcCPhlXhBdLDKELinEQUYyS0F807oN8HAihugqA3K6t6dyBIvU2KGWCF3
	 zGTPsTmKIsS8xGP8m/DzDkaHamv16C7XkwwYmapuK2RZg0zhFujMZNNjpTd1gz/sYb
	 AsrzOPzvYj3AqpKD+YZoRg8AQeH2CN2lX6hsjXmgEFGsEcgTtKmFfyQZJdBb7sZ0Wh
	 Vjv4dWB8WivODlm2d0NkCR3e1PJJtE9EVjUbvdsuoSc4y9Y13lioIfKeBmReUFkMj8
	 OqMb9vdxM+2SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C759884A79;
	Fri, 29 May 2026 21:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F19CF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 049F442336
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_aZRgO1WEha for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A8C3404E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8C3404E6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8C3404E6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:36:59 +0000 (UTC)
Received: from bubutux.localdomain (82-65-127-30.subs.proxad.net
 [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3EE7F2C89121;
 Fri, 29 May 2026 23:36:54 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:36:48 +0200
Message-ID: <20260529213651.548156-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529213651.548156-1-buildroot@bubu1.eu>
References: <20260529213651.548156-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 May 2026 21:38:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780090617; bh=xm72k2F2x/ru5e1m4ZdArRwHDMRgdZ0baYGVFE4ZQt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=si/AmeOvQ2lq+dM7uHzmJR8yPWSzD9XvtmSCHgNKK6OXb+u1SfYQ80TI/vRAdmsWO
 GqUPg9yK4HADM1fXKo9SaGO3AxhBXjPD/SftM7TA9V6EJPuoMmVK2rTZTkMRIAuRC7
 B3ODxiDZVyIa/JVAI2LampIMIGk56sQ1JzTpmA/b4WcRYJYXX2Cvvof3De+91Iyzjs
 iQOxulblfxgBk8oKmQbka/PT9VFDFaoM/BAdob06du2jHsyxBzJHH4yjWdDx2cYRKw
 dxdztMS3UPQBSE+gA/tLCeC+gFD3PTnUw51i6V4EuHVjnuWrFD6NgOg/bfmMA5Cr09
 3Hr++u/RwTW9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=si/AmeOv
Subject: [Buildroot] [next 2/2] package: switch all pypi download urls to
 pypi helper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>, "Yann E. MORIN" <yann.morin@orange.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Uladzimir Bely <wiselord1983@gmail.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Vincent Cruz <mooz@blockos.org>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 Lionel Flandrin <lionel@svkt.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 Geoffrey Ragot <geoffreyragot@gmail.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Xukai Wang <kingxukai@zohomail.com>, Olivier Matz <olivier.matz@6wind.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Arno Messiaen <arnomessiaen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>, Vinicius Tinti <viniciustinti@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Ian Haylock <haylocki@yahoo.co.uk>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Damien Le Moal <dlemoal@kernel.org>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Esben Haabendal <esben@haabendal.dk>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Bernd Kuhls <bernd@kuhls.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Mauro Condarelli <mc5686@mclink.it>, Falco Hyfing <hyfinglists@gmail.com>,
 John Faith <jfaith@impinj.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Nasser Afshin <afshin.nasser@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This change was done with the following (hacky) script:
```
import shutil
import subprocess
import sys

pkg_makefile = sys.argv[1]
pkg_name = sys.argv[1].split("/")[-2]
pkg_path = f"packge/{pkg_name}"

if sys.argv[1] == "package/pkg-download.mk":
    # don't process the download infrastructure file
    exit()
with open(pkg_makefile) as source, open(f"{pkg_makefile}.tmp", "w") as target:
    pkg_source = None
    for line in source.readlines():
        if "_SOURCE = " in line:
            pkg_source = "-".join(line.split("=", 1)[1].strip().split("-")[:-1])
        if "_SITE = " in line:
            if not pkg_source:
                # No explicit package archive name, use the package-name which is the default
                pkg_source = pkg_name
            siteprefix = line.split("=", 1)[0].strip()
            newsite = f"$(call pypi,{pkg_source})"
            target.write(f"{siteprefix} = {newsite}\n")
        else:
            target.write(line)

shutil.move(f"{pkg_makefile}.tmp", pkg_makefile)

subprocess.call(args=["git", "add", sys.argv[1]])
```

which was then invoked as:
$ grep -l -r files.pythonhosted.org package/ | xargs -L1 ./replace-pypi-urls.py

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/circus/circus.mk                                        | 2 +-
 package/crudini/crudini.mk                                      | 2 +-
 package/python-aenum/python-aenum.mk                            | 2 +-
 package/python-aerich/python-aerich.mk                          | 2 +-
 package/python-aexpect/python-aexpect.mk                        | 2 +-
 package/python-aioblescan/python-aioblescan.mk                  | 2 +-
 package/python-aiocoap/python-aiocoap.mk                        | 2 +-
 package/python-aioconsole/python-aioconsole.mk                  | 2 +-
 package/python-aiodns/python-aiodns.mk                          | 2 +-
 package/python-aiofiles/python-aiofiles.mk                      | 2 +-
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk      | 2 +-
 package/python-aiohttp-cors/python-aiohttp-cors.mk              | 2 +-
 .../python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk  | 2 +-
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk          | 2 +-
 package/python-aiohttp-mako/python-aiohttp-mako.mk              | 2 +-
 package/python-aiohttp-remotes/python-aiohttp-remotes.mk        | 2 +-
 package/python-aiohttp-security/python-aiohttp-security.mk      | 2 +-
 package/python-aiohttp-session/python-aiohttp-session.mk        | 2 +-
 package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk  | 2 +-
 package/python-aiohttp-sse/python-aiohttp-sse.mk                | 2 +-
 package/python-aiohttp/python-aiohttp.mk                        | 2 +-
 package/python-aiojobs/python-aiojobs.mk                        | 2 +-
 package/python-aiologstash/python-aiologstash.mk                | 2 +-
 package/python-aiomonitor/python-aiomonitor.mk                  | 2 +-
 package/python-aiomqtt/python-aiomqtt.mk                        | 2 +-
 package/python-aioprocessing/python-aioprocessing.mk            | 2 +-
 package/python-aiorwlock/python-aiorwlock.mk                    | 2 +-
 package/python-aiosignal/python-aiosignal.mk                    | 2 +-
 package/python-aiosqlite/python-aiosqlite.mk                    | 2 +-
 package/python-aiozipkin/python-aiozipkin.mk                    | 2 +-
 package/python-alembic/python-alembic.mk                        | 2 +-
 package/python-alsaaudio/python-alsaaudio.mk                    | 2 +-
 package/python-aniso8601/python-aniso8601.mk                    | 2 +-
 package/python-annotated-doc/python-annotated-doc.mk            | 2 +-
 package/python-annotated-types/python-annotated-types.mk        | 2 +-
 package/python-ansicolors/python-ansicolors.mk                  | 2 +-
 package/python-anyio/python-anyio.mk                            | 2 +-
 package/python-apispec/python-apispec.mk                        | 2 +-
 package/python-appdirs/python-appdirs.mk                        | 2 +-
 package/python-apscheduler/python-apscheduler.mk                | 2 +-
 package/python-argcomplete/python-argcomplete.mk                | 2 +-
 package/python-argh/python-argh.mk                              | 2 +-
 .../python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk  | 2 +-
 package/python-argon2-cffi/python-argon2-cffi.mk                | 2 +-
 package/python-arrow/python-arrow.mk                            | 2 +-
 package/python-asgiref/python-asgiref.mk                        | 2 +-
 package/python-asn1crypto/python-asn1crypto.mk                  | 2 +-
 package/python-asttokens/python-asttokens.mk                    | 2 +-
 package/python-async-generator/python-async-generator.mk        | 2 +-
 package/python-async-lru/python-async-lru.mk                    | 2 +-
 package/python-async-timeout/python-async-timeout.mk            | 2 +-
 package/python-asyncclick/python-asyncclick.mk                  | 2 +-
 package/python-asyncssh/python-asyncssh.mk                      | 2 +-
 package/python-attrs/python-attrs.mk                            | 2 +-
 package/python-autobahn/python-autobahn.mk                      | 2 +-
 package/python-autocommand/python-autocommand.mk                | 2 +-
 package/python-automat/python-automat.mk                        | 2 +-
 package/python-avro/python-avro.mk                              | 2 +-
 package/python-babel/python-babel.mk                            | 2 +-
 package/python-backcall/python-backcall.mk                      | 2 +-
 package/python-base58/python-base58.mk                          | 2 +-
 package/python-bcrypt/python-bcrypt.mk                          | 2 +-
 package/python-beautifulsoup4/python-beautifulsoup4.mk          | 2 +-
 package/python-beniget/python-beniget.mk                        | 2 +-
 package/python-betterproto/python-betterproto.mk                | 2 +-
 package/python-bidict/python-bidict.mk                          | 2 +-
 package/python-bitarray/python-bitarray.mk                      | 2 +-
 package/python-bitstring/python-bitstring.mk                    | 2 +-
 package/python-bleak/python-bleak.mk                            | 2 +-
 package/python-blinker/python-blinker.mk                        | 2 +-
 package/python-bluezero/python-bluezero.mk                      | 2 +-
 package/python-boto3/python-boto3.mk                            | 2 +-
 package/python-botocore/python-botocore.mk                      | 2 +-
 package/python-bottle/python-bottle.mk                          | 2 +-
 package/python-brotli/python-brotli.mk                          | 2 +-
 package/python-bsdiff4/python-bsdiff4.mk                        | 2 +-
 package/python-cached-property/python-cached-property.mk        | 2 +-
 package/python-cachelib/python-cachelib.mk                      | 2 +-
 package/python-cachetools/python-cachetools.mk                  | 2 +-
 package/python-calver/python-calver.mk                          | 2 +-
 package/python-can/python-can.mk                                | 2 +-
 package/python-canopen/python-canopen.mk                        | 2 +-
 package/python-cbor2/python-cbor2.mk                            | 2 +-
 package/python-cchardet/python-cchardet.mk                      | 2 +-
 package/python-certifi/python-certifi.mk                        | 2 +-
 package/python-cffi/python-cffi.mk                              | 2 +-
 package/python-changelog-chug/python-changelog-chug.mk          | 2 +-
 package/python-channels-redis/python-channels-redis.mk          | 2 +-
 package/python-channels/python-channels.mk                      | 2 +-
 package/python-characteristic/python-characteristic.mk          | 2 +-
 package/python-chardet/python-chardet.mk                        | 2 +-
 package/python-charset-normalizer/python-charset-normalizer.mk  | 2 +-
 package/python-cheetah/python-cheetah.mk                        | 2 +-
 package/python-cheroot/python-cheroot.mk                        | 2 +-
 package/python-cherrypy/python-cherrypy.mk                      | 2 +-
 package/python-click/python-click.mk                            | 2 +-
 package/python-cloudpickle/python-cloudpickle.mk                | 2 +-
 package/python-coherent-licensed/python-coherent-licensed.mk    | 2 +-
 package/python-colorama/python-colorama.mk                      | 2 +-
 package/python-colorlog/python-colorlog.mk                      | 2 +-
 package/python-colorzero/python-colorzero.mk                    | 2 +-
 package/python-configobj/python-configobj.mk                    | 2 +-
 package/python-constantly/python-constantly.mk                  | 2 +-
 package/python-construct/python-construct.mk                    | 2 +-
 package/python-contourpy/python-contourpy.mk                    | 2 +-
 package/python-couchdb/python-couchdb.mk                        | 2 +-
 package/python-cppy/python-cppy.mk                              | 2 +-
 package/python-crayons/python-crayons.mk                        | 2 +-
 package/python-crc/python-crc.mk                                | 2 +-
 package/python-crc16/python-crc16.mk                            | 2 +-
 package/python-crccheck/python-crccheck.mk                      | 2 +-
 package/python-crcmod/python-crcmod.mk                          | 2 +-
 package/python-crontab/python-crontab.mk                        | 2 +-
 package/python-cryptography/python-cryptography.mk              | 2 +-
 package/python-cssselect/python-cssselect.mk                    | 2 +-
 package/python-cssselect2/python-cssselect2.mk                  | 2 +-
 package/python-cssutils/python-cssutils.mk                      | 2 +-
 package/python-cycler/python-cycler.mk                          | 2 +-
 package/python-cython/python-cython.mk                          | 2 +-
 package/python-daemon/python-daemon.mk                          | 2 +-
 package/python-daemonize/python-daemonize.mk                    | 2 +-
 package/python-daphne/python-daphne.mk                          | 2 +-
 package/python-dataproperty/python-dataproperty.mk              | 2 +-
 package/python-dateutil/python-dateutil.mk                      | 2 +-
 package/python-dbus-fast/python-dbus-fast.mk                    | 2 +-
 package/python-dbus-next/python-dbus-next.mk                    | 2 +-
 package/python-decorator/python-decorator.mk                    | 2 +-
 package/python-decouple/python-decouple.mk                      | 2 +-
 package/python-defusedxml/python-defusedxml.mk                  | 2 +-
 package/python-deprecation/python-deprecation.mk                | 2 +-
 package/python-dialog3/python-dialog3.mk                        | 2 +-
 package/python-dictdiffer/python-dictdiffer.mk                  | 2 +-
 package/python-dicttoxml/python-dicttoxml.mk                    | 2 +-
 package/python-dicttoxml2/python-dicttoxml2.mk                  | 2 +-
 package/python-diskcache/python-diskcache.mk                    | 2 +-
 package/python-distlib/python-distlib.mk                        | 2 +-
 package/python-distro/python-distro.mk                          | 2 +-
 package/python-django-enumfields/python-django-enumfields.mk    | 2 +-
 package/python-django/python-django.mk                          | 2 +-
 package/python-dnspython/python-dnspython.mk                    | 2 +-
 package/python-docker-pycreds/python-docker-pycreds.mk          | 2 +-
 package/python-docker/python-docker.mk                          | 2 +-
 package/python-dockerpty/python-dockerpty.mk                    | 2 +-
 package/python-docutils/python-docutils.mk                      | 2 +-
 package/python-dominate/python-dominate.mk                      | 2 +-
 package/python-dotenv/python-dotenv.mk                          | 2 +-
 package/python-dpkt/python-dpkt.mk                              | 2 +-
 package/python-dtschema/python-dtschema.mk                      | 2 +-
 package/python-ecdsa/python-ecdsa.mk                            | 2 +-
 package/python-editables/python-editables.mk                    | 2 +-
 package/python-email-validator/python-email-validator.mk        | 2 +-
 package/python-emailproxy/python-emailproxy.mk                  | 2 +-
 package/python-engineio/python-engineio.mk                      | 2 +-
 package/python-entrypoints/python-entrypoints.mk                | 2 +-
 package/python-esptool/python-esptool.mk                        | 2 +-
 package/python-evdev/python-evdev.mk                            | 2 +-
 package/python-executing/python-executing.mk                    | 2 +-
 package/python-expandvars/python-expandvars.mk                  | 2 +-
 package/python-falcon/python-falcon.mk                          | 2 +-
 .../python-farama-notifications/python-farama-notifications.mk  | 2 +-
 package/python-fastapi-sessions/python-fastapi-sessions.mk      | 2 +-
 package/python-fastapi/python-fastapi.mk                        | 2 +-
 package/python-fastentrypoints/python-fastentrypoints.mk        | 2 +-
 package/python-fastui/python-fastui.mk                          | 2 +-
 package/python-filelock/python-filelock.mk                      | 2 +-
 package/python-fire/python-fire.mk                              | 2 +-
 package/python-flask-babel/python-flask-babel.mk                | 2 +-
 package/python-flask-caching/python-flask-caching.mk            | 2 +-
 package/python-flask-cors/python-flask-cors.mk                  | 2 +-
 package/python-flask-expects-json/python-flask-expects-json.mk  | 2 +-
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk            | 2 +-
 package/python-flask-login/python-flask-login.mk                | 2 +-
 package/python-flask-restx/python-flask-restx.mk                | 2 +-
 package/python-flask-smorest/python-flask-smorest.mk            | 2 +-
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk      | 2 +-
 package/python-flask-wtf/python-flask-wtf.mk                    | 2 +-
 package/python-flask/python-flask.mk                            | 2 +-
 package/python-flatbuffers/python-flatbuffers.mk                | 2 +-
 package/python-flit-core/python-flit-core.mk                    | 2 +-
 package/python-flup/python-flup.mk                              | 2 +-
 package/python-fonttools/python-fonttools.mk                    | 2 +-
 package/python-frozenlist/python-frozenlist.mk                  | 2 +-
 package/python-fs/python-fs.mk                                  | 2 +-
 package/python-future/python-future.mk                          | 2 +-
 package/python-gast/python-gast.mk                              | 2 +-
 package/python-git/python-git.mk                                | 2 +-
 package/python-gitdb2/python-gitdb2.mk                          | 2 +-
 package/python-gnupg/python-gnupg.mk                            | 2 +-
 package/python-google-api-core/python-google-api-core.mk        | 2 +-
 package/python-google-auth/python-google-auth.mk                | 2 +-
 .../python-googleapis-common-protos.mk                          | 2 +-
 package/python-gpiod/python-gpiod.mk                            | 2 +-
 package/python-gpiozero/python-gpiozero.mk                      | 2 +-
 package/python-greenlet/python-greenlet.mk                      | 2 +-
 package/python-grpc-requests/python-grpc-requests.mk            | 2 +-
 package/python-grpcio-reflection/python-grpcio-reflection.mk    | 2 +-
 package/python-grpcio/python-grpcio.mk                          | 2 +-
 package/python-grpclib/python-grpclib.mk                        | 2 +-
 package/python-gunicorn/python-gunicorn.mk                      | 2 +-
 package/python-gymnasium/python-gymnasium.mk                    | 2 +-
 package/python-h11/python-h11.mk                                | 2 +-
 package/python-h2/python-h2.mk                                  | 2 +-
 .../python-hatch-fancy-pypi-readme.mk                           | 2 +-
 package/python-hatch-vcs/python-hatch-vcs.mk                    | 2 +-
 package/python-hatchling/python-hatchling.mk                    | 2 +-
 package/python-hid/python-hid.mk                                | 2 +-
 package/python-hiredis/python-hiredis.mk                        | 2 +-
 package/python-hkdf/python-hkdf.mk                              | 2 +-
 package/python-hpack/python-hpack.mk                            | 2 +-
 package/python-html5lib/python-html5lib.mk                      | 2 +-
 package/python-httpcore/python-httpcore.mk                      | 2 +-
 package/python-httplib2/python-httplib2.mk                      | 2 +-
 package/python-httpx/python-httpx.mk                            | 2 +-
 package/python-huepy/python-huepy.mk                            | 2 +-
 package/python-humanfriendly/python-humanfriendly.mk            | 2 +-
 package/python-humanize/python-humanize.mk                      | 2 +-
 package/python-hwdata/python-hwdata.mk                          | 2 +-
 package/python-hyperframe/python-hyperframe.mk                  | 2 +-
 package/python-hyperlink/python-hyperlink.mk                    | 2 +-
 package/python-ibmiotf/python-ibmiotf.mk                        | 2 +-
 package/python-idna/python-idna.mk                              | 2 +-
 package/python-ifaddr/python-ifaddr.mk                          | 2 +-
 package/python-immutabledict/python-immutabledict.mk            | 2 +-
 package/python-incremental/python-incremental.mk                | 2 +-
 package/python-inflect/python-inflect.mk                        | 2 +-
 package/python-inflection/python-inflection.mk                  | 2 +-
 package/python-influxdb/python-influxdb.mk                      | 2 +-
 package/python-iniconfig/python-iniconfig.mk                    | 2 +-
 package/python-iniparse/python-iniparse.mk                      | 2 +-
 package/python-installer/python-installer.mk                    | 2 +-
 package/python-intelhex/python-intelhex.mk                      | 2 +-
 package/python-iowait/python-iowait.mk                          | 2 +-
 package/python-ipdb/python-ipdb.mk                              | 2 +-
 package/python-iptables/python-iptables.mk                      | 2 +-
 package/python-ipy/python-ipy.mk                                | 2 +-
 package/python-ipython-genutils/python-ipython-genutils.mk      | 2 +-
 .../python-ipython-pygments-lexers.mk                           | 2 +-
 package/python-ipython/python-ipython.mk                        | 2 +-
 package/python-iso8601/python-iso8601.mk                        | 2 +-
 package/python-isodate/python-isodate.mk                        | 2 +-
 package/python-iterable-io/python-iterable-io.mk                | 2 +-
 package/python-itsdangerous/python-itsdangerous.mk              | 2 +-
 package/python-iwlib/python-iwlib.mk                            | 2 +-
 package/python-janus/python-janus.mk                            | 2 +-
 package/python-jaraco-classes/python-jaraco-classes.mk          | 2 +-
 package/python-jaraco-collections/python-jaraco-collections.mk  | 2 +-
 package/python-jaraco-context/python-jaraco-context.mk          | 2 +-
 package/python-jaraco-functools/python-jaraco-functools.mk      | 2 +-
 package/python-jaraco-text/python-jaraco-text.mk                | 2 +-
 package/python-jc/python-jc.mk                                  | 2 +-
 package/python-jedi/python-jedi.mk                              | 2 +-
 package/python-jeepney/python-jeepney.mk                        | 2 +-
 package/python-jinja2/python-jinja2.mk                          | 2 +-
 package/python-jmespath/python-jmespath.mk                      | 2 +-
 .../python-json-schema-validator.mk                             | 2 +-
 package/python-jsonmodels/python-jsonmodels.mk                  | 2 +-
 .../python-jsonschema-specifications.mk                         | 2 +-
 package/python-jsonschema/python-jsonschema.mk                  | 2 +-
 package/python-keyring/python-keyring.mk                        | 2 +-
 package/python-kflash/python-kflash.mk                          | 2 +-
 package/python-kiwisolver/python-kiwisolver.mk                  | 2 +-
 package/python-lark/python-lark.mk                              | 2 +-
 package/python-legacy-cgi/python-legacy-cgi.mk                  | 2 +-
 package/python-libconf/python-libconf.mk                        | 2 +-
 package/python-libevdev/python-libevdev.mk                      | 2 +-
 package/python-librt/python-librt.mk                            | 2 +-
 package/python-libusb1/python-libusb1.mk                        | 2 +-
 package/python-lmdb/python-lmdb.mk                              | 2 +-
 package/python-lockfile/python-lockfile.mk                      | 2 +-
 package/python-log-rate-limit/python-log-rate-limit.mk          | 2 +-
 package/python-logbook/python-logbook.mk                        | 2 +-
 package/python-logstash/python-logstash.mk                      | 2 +-
 package/python-lxml/python-lxml.mk                              | 2 +-
 .../python-magic-wormhole-mailbox-server.mk                     | 2 +-
 .../python-magic-wormhole-transit-relay.mk                      | 2 +-
 package/python-magic-wormhole/python-magic-wormhole.mk          | 2 +-
 package/python-mako/python-mako.mk                              | 2 +-
 package/python-markdown-it-py/python-markdown-it-py.mk          | 2 +-
 package/python-markdown/python-markdown.mk                      | 2 +-
 package/python-markdown2/python-markdown2.mk                    | 2 +-
 package/python-markupsafe/python-markupsafe.mk                  | 2 +-
 .../python-marshmallow-sqlalchemy.mk                            | 2 +-
 package/python-marshmallow/python-marshmallow.mk                | 2 +-
 package/python-matplotlib-inline/python-matplotlib-inline.mk    | 2 +-
 package/python-matplotlib/python-matplotlib.mk                  | 2 +-
 package/python-maturin/python-maturin.mk                        | 2 +-
 package/python-mbstrdecoder/python-mbstrdecoder.mk              | 2 +-
 package/python-mdit-py-plugins/python-mdit-py-plugins.mk        | 2 +-
 package/python-mdurl/python-mdurl.mk                            | 2 +-
 package/python-memory-profiler/python-memory-profiler.mk        | 2 +-
 package/python-memray/python-memray.mk                          | 2 +-
 package/python-meson-python/python-meson-python.mk              | 2 +-
 package/python-midiutil/python-midiutil.mk                      | 2 +-
 package/python-mimeparse/python-mimeparse.mk                    | 2 +-
 package/python-minimalmodbus/python-minimalmodbus.mk            | 2 +-
 package/python-mistune/python-mistune.mk                        | 2 +-
 package/python-ml-dtypes/python-ml-dtypes.mk                    | 2 +-
 package/python-modbus-tk/python-modbus-tk.mk                    | 2 +-
 package/python-more-itertools/python-more-itertools.mk          | 2 +-
 package/python-mpd2/python-mpd2.mk                              | 2 +-
 package/python-mpmath/python-mpmath.mk                          | 2 +-
 package/python-msgfy/python-msgfy.mk                            | 2 +-
 package/python-msgpack/python-msgpack.mk                        | 2 +-
 package/python-multidict/python-multidict.mk                    | 2 +-
 package/python-multipart/python-multipart.mk                    | 2 +-
 package/python-munch/python-munch.mk                            | 2 +-
 package/python-mutagen/python-mutagen.mk                        | 2 +-
 package/python-mwclient/python-mwclient.mk                      | 2 +-
 package/python-mypy-extensions/python-mypy-extensions.mk        | 2 +-
 package/python-mypy/python-mypy.mk                              | 2 +-
 package/python-nested-dict/python-nested-dict.mk                | 2 +-
 package/python-netaddr/python-netaddr.mk                        | 2 +-
 package/python-netifaces/python-netifaces.mk                    | 2 +-
 package/python-networkmanager/python-networkmanager.mk          | 2 +-
 package/python-networkx/python-networkx.mk                      | 2 +-
 package/python-numpy/python-numpy.mk                            | 2 +-
 package/python-oauthlib/python-oauthlib.mk                      | 2 +-
 package/python-opcua-asyncio/python-opcua-asyncio.mk            | 2 +-
 package/python-orjson/python-orjson.mk                          | 2 +-
 package/python-outcome/python-outcome.mk                        | 2 +-
 package/python-packaging/python-packaging.mk                    | 2 +-
 package/python-paramiko/python-paramiko.mk                      | 2 +-
 package/python-parso/python-parso.mk                            | 2 +-
 package/python-passlib/python-passlib.mk                        | 2 +-
 package/python-patch-ng/python-patch-ng.mk                      | 2 +-
 package/python-path/python-path.mk                              | 2 +-
 package/python-pathpy/python-pathpy.mk                          | 2 +-
 package/python-pathspec/python-pathspec.mk                      | 2 +-
 package/python-pathvalidate/python-pathvalidate.mk              | 2 +-
 package/python-pbr/python-pbr.mk                                | 2 +-
 package/python-pdm-backend/python-pdm-backend.mk                | 2 +-
 package/python-pefile/python-pefile.mk                          | 2 +-
 package/python-periphery/python-periphery.mk                    | 2 +-
 package/python-pexpect/python-pexpect.mk                        | 2 +-
 package/python-pickleshare/python-pickleshare.mk                | 2 +-
 package/python-pigpio/python-pigpio.mk                          | 2 +-
 package/python-pillow/python-pillow.mk                          | 2 +-
 package/python-pip/python-pip.mk                                | 2 +-
 package/python-pkgconfig/python-pkgconfig.mk                    | 2 +-
 package/python-platformdirs/python-platformdirs.mk              | 2 +-
 package/python-pluggy/python-pluggy.mk                          | 2 +-
 package/python-ply/python-ply.mk                                | 2 +-
 package/python-poetry-core/python-poetry-core.mk                | 2 +-
 package/python-portend/python-portend.mk                        | 2 +-
 package/python-posix-ipc/python-posix-ipc.mk                    | 2 +-
 package/python-priority/python-priority.mk                      | 2 +-
 package/python-prompt-toolkit/python-prompt-toolkit.mk          | 2 +-
 package/python-propcache/python-propcache.mk                    | 2 +-
 package/python-proto-plus/python-proto-plus.mk                  | 2 +-
 package/python-protobuf/python-protobuf.mk                      | 2 +-
 package/python-psutil/python-psutil.mk                          | 2 +-
 package/python-psycopg2/python-psycopg2.mk                      | 2 +-
 package/python-psygnal/python-psygnal.mk                        | 2 +-
 package/python-ptyprocess/python-ptyprocess.mk                  | 2 +-
 package/python-pudb/python-pudb.mk                              | 2 +-
 package/python-pure-eval/python-pure-eval.mk                    | 2 +-
 package/python-py/python-py.mk                                  | 2 +-
 package/python-pyaes/python-pyaes.mk                            | 2 +-
 package/python-pyaml/python-pyaml.mk                            | 2 +-
 package/python-pyasn1-modules/python-pyasn1-modules.mk          | 2 +-
 package/python-pyasn1/python-pyasn1.mk                          | 2 +-
 package/python-pyasynchat/python-pyasynchat.mk                  | 2 +-
 package/python-pyasyncore/python-pyasyncore.mk                  | 2 +-
 package/python-pycairo/python-pycairo.mk                        | 2 +-
 package/python-pycares/python-pycares.mk                        | 2 +-
 package/python-pycparser/python-pycparser.mk                    | 2 +-
 package/python-pycrate/python-pycrate.mk                        | 2 +-
 package/python-pycryptodomex/python-pycryptodomex.mk            | 2 +-
 package/python-pycups/python-pycups.mk                          | 2 +-
 package/python-pydal/python-pydal.mk                            | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk            | 2 +-
 package/python-pydantic-settings/python-pydantic-settings.mk    | 2 +-
 package/python-pydantic/python-pydantic.mk                      | 2 +-
 package/python-pydyf/python-pydyf.mk                            | 2 +-
 package/python-pyelftools/python-pyelftools.mk                  | 2 +-
 package/python-pyfatfs/python-pyfatfs.mk                        | 2 +-
 package/python-pyftpdlib/python-pyftpdlib.mk                    | 2 +-
 package/python-pygments/python-pygments.mk                      | 2 +-
 package/python-pyhamcrest/python-pyhamcrest.mk                  | 2 +-
 package/python-pyicu/python-pyicu.mk                            | 2 +-
 package/python-pyinotify/python-pyinotify.mk                    | 2 +-
 package/python-pyjwt/python-pyjwt.mk                            | 2 +-
 package/python-pylibfdt/python-pylibfdt.mk                      | 2 +-
 package/python-pylibftdi/python-pylibftdi.mk                    | 2 +-
 package/python-pylru/python-pylru.mk                            | 2 +-
 package/python-pymodbus/python-pymodbus.mk                      | 2 +-
 package/python-pymupdf/python-pymupdf.mk                        | 2 +-
 package/python-pymysql/python-pymysql.mk                        | 2 +-
 package/python-pynacl/python-pynacl.mk                          | 2 +-
 package/python-pyndiff/python-pyndiff.mk                        | 2 +-
 package/python-pyopenssl/python-pyopenssl.mk                    | 2 +-
 package/python-pypa-build/python-pypa-build.mk                  | 2 +-
 package/python-pyparsing/python-pyparsing.mk                    | 2 +-
 package/python-pyparted/python-pyparted.mk                      | 2 +-
 package/python-pyphen/python-pyphen.mk                          | 2 +-
 package/python-pypika-tortoise/python-pypika-tortoise.mk        | 2 +-
 package/python-pypng/python-pypng.mk                            | 2 +-
 package/python-pyproj/python-pyproj.mk                          | 2 +-
 package/python-pyproject-hooks/python-pyproject-hooks.mk        | 2 +-
 package/python-pyproject-metadata/python-pyproject-metadata.mk  | 2 +-
 package/python-pyqrcode/python-pyqrcode.mk                      | 2 +-
 package/python-pyqt5-sip/python-pyqt5-sip.mk                    | 2 +-
 package/python-pyqt5/python-pyqt5.mk                            | 2 +-
 package/python-pyroute2/python-pyroute2.mk                      | 2 +-
 package/python-pyrsistent/python-pyrsistent.mk                  | 2 +-
 package/python-pysendfile/python-pysendfile.mk                  | 2 +-
 package/python-pysensors/python-pysensors.mk                    | 2 +-
 package/python-pysftp/python-pysftp.mk                          | 2 +-
 package/python-pysmb/python-pysmb.mk                            | 2 +-
 package/python-pysmi/python-pysmi.mk                            | 2 +-
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk                | 2 +-
 package/python-pysnmp/python-pysnmp.mk                          | 2 +-
 package/python-pysnmpcrypto/python-pysnmpcrypto.mk              | 2 +-
 package/python-pysocks/python-pysocks.mk                        | 2 +-
 package/python-pyspnego/python-pyspnego.mk                      | 2 +-
 package/python-pytablereader/python-pytablereader.mk            | 2 +-
 package/python-pytablewriter/python-pytablewriter.mk            | 2 +-
 package/python-pytest-asyncio/python-pytest-asyncio.mk          | 2 +-
 package/python-pytest/python-pytest.mk                          | 2 +-
 package/python-pythran/python-pythran.mk                        | 2 +-
 package/python-pytrie/python-pytrie.mk                          | 2 +-
 package/python-pytz/python-pytz.mk                              | 2 +-
 package/python-pyudev/python-pyudev.mk                          | 2 +-
 package/python-pyusb/python-pyusb.mk                            | 2 +-
 package/python-pyyaml/python-pyyaml.mk                          | 2 +-
 package/python-pyzmq/python-pyzmq.mk                            | 2 +-
 package/python-qrcode/python-qrcode.mk                          | 2 +-
 package/python-raven/python-raven.mk                            | 2 +-
 package/python-redis/python-redis.mk                            | 2 +-
 package/python-reedsolo/python-reedsolo.mk                      | 2 +-
 package/python-reentry/python-reentry.mk                        | 2 +-
 package/python-referencing/python-referencing.mk                | 2 +-
 package/python-regex/python-regex.mk                            | 2 +-
 package/python-request-id/python-request-id.mk                  | 2 +-
 package/python-requests-oauthlib/python-requests-oauthlib.mk    | 2 +-
 package/python-requests-toolbelt/python-requests-toolbelt.mk    | 2 +-
 package/python-requests/python-requests.mk                      | 2 +-
 package/python-rfc3987/python-rfc3987.mk                        | 2 +-
 package/python-rich/python-rich.mk                              | 2 +-
 package/python-rpds-py/python-rpds-py.mk                        | 2 +-
 package/python-rpi-gpio/python-rpi-gpio.mk                      | 2 +-
 package/python-rpi-ws281x/python-rpi-ws281x.mk                  | 2 +-
 package/python-rsa/python-rsa.mk                                | 2 +-
 package/python-rtoml/python-rtoml.mk                            | 2 +-
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk      | 2 +-
 package/python-ruamel-yaml/python-ruamel-yaml.mk                | 2 +-
 package/python-s3transfer/python-s3transfer.mk                  | 2 +-
 package/python-scandir/python-scandir.mk                        | 2 +-
 package/python-scapy/python-scapy.mk                            | 2 +-
 package/python-schedule/python-schedule.mk                      | 2 +-
 package/python-scipy/python-scipy.mk                            | 2 +-
 package/python-scp/python-scp.mk                                | 2 +-
 package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk  | 2 +-
 .../python-sdbus-networkmanager/python-sdbus-networkmanager.mk  | 2 +-
 package/python-sdbus-systemd/python-sdbus-systemd.mk            | 2 +-
 package/python-sdbus/python-sdbus.mk                            | 2 +-
 package/python-sdnotify/python-sdnotify.mk                      | 2 +-
 package/python-secretstorage/python-secretstorage.mk            | 2 +-
 package/python-segno/python-segno.mk                            | 2 +-
 package/python-selenium/python-selenium.mk                      | 2 +-
 package/python-semantic-version/python-semantic-version.mk      | 2 +-
 package/python-semver/python-semver.mk                          | 2 +-
 package/python-sentry-sdk/python-sentry-sdk.mk                  | 2 +-
 package/python-serial-asyncio/python-serial-asyncio.mk          | 2 +-
 package/python-serial/python-serial.mk                          | 2 +-
 package/python-service-identity/python-service-identity.mk      | 2 +-
 package/python-setproctitle/python-setproctitle.mk              | 2 +-
 package/python-setuptools-rust/python-setuptools-rust.mk        | 2 +-
 package/python-setuptools-scm/python-setuptools-scm.mk          | 2 +-
 package/python-setuptools/python-setuptools.mk                  | 2 +-
 package/python-sh/python-sh.mk                                  | 2 +-
 package/python-simple-pid/python-simple-pid.mk                  | 2 +-
 package/python-simple-websocket/python-simple-websocket.mk      | 2 +-
 package/python-simpleaudio/python-simpleaudio.mk                | 2 +-
 package/python-simplejson/python-simplejson.mk                  | 2 +-
 package/python-simplelogging/python-simplelogging.mk            | 2 +-
 package/python-simplesqlite/python-simplesqlite.mk              | 2 +-
 package/python-six/python-six.mk                                | 2 +-
 package/python-smbprotocol/python-smbprotocol.mk                | 2 +-
 package/python-smbus2/python-smbus2.mk                          | 2 +-
 package/python-smmap2/python-smmap2.mk                          | 2 +-
 package/python-snappy/python-snappy.mk                          | 2 +-
 package/python-sniffio/python-sniffio.mk                        | 2 +-
 package/python-socketio/python-socketio.mk                      | 2 +-
 package/python-sockjs/python-sockjs.mk                          | 2 +-
 package/python-sortedcontainers/python-sortedcontainers.mk      | 2 +-
 package/python-soupsieve/python-soupsieve.mk                    | 2 +-
 package/python-spake2/python-spake2.mk                          | 2 +-
 package/python-spidev/python-spidev.mk                          | 2 +-
 package/python-sqlalchemy/python-sqlalchemy.mk                  | 2 +-
 package/python-sqliteschema/python-sqliteschema.mk              | 2 +-
 package/python-sqlparse/python-sqlparse.mk                      | 2 +-
 package/python-stack-data/python-stack-data.mk                  | 2 +-
 package/python-starlette/python-starlette.mk                    | 2 +-
 package/python-sympy/python-sympy.mk                            | 2 +-
 package/python-systemd/python-systemd.mk                        | 2 +-
 package/python-tabledata/python-tabledata.mk                    | 2 +-
 package/python-tcolorpy/python-tcolorpy.mk                      | 2 +-
 package/python-telnetlib3/python-telnetlib3.mk                  | 2 +-
 package/python-tempora/python-tempora.mk                        | 2 +-
 package/python-termcolor/python-termcolor.mk                    | 2 +-
 package/python-terminaltables/python-terminaltables.mk          | 2 +-
 package/python-texttable/python-texttable.mk                    | 2 +-
 package/python-textual/python-textual.mk                        | 2 +-
 package/python-tftpy/python-tftpy.mk                            | 2 +-
 package/python-thrift/python-thrift.mk                          | 2 +-
 package/python-tinycss2/python-tinycss2.mk                      | 2 +-
 package/python-tinyhtml5/python-tinyhtml5.mk                    | 2 +-
 package/python-tinyrpc/python-tinyrpc.mk                        | 2 +-
 package/python-toml/python-toml.mk                              | 2 +-
 package/python-tomli-w/python-tomli-w.mk                        | 2 +-
 package/python-tomli/python-tomli.mk                            | 2 +-
 package/python-tomlkit/python-tomlkit.mk                        | 2 +-
 package/python-tornado/python-tornado.mk                        | 2 +-
 package/python-tortoise-orm/python-tortoise-orm.mk              | 2 +-
 package/python-tpm2-pytss/python-tpm2-pytss.mk                  | 2 +-
 package/python-tqdm/python-tqdm.mk                              | 2 +-
 package/python-trafaret/python-trafaret.mk                      | 2 +-
 package/python-traitlets/python-traitlets.mk                    | 2 +-
 package/python-transitions/python-transitions.mk                | 2 +-
 package/python-treq/python-treq.mk                              | 2 +-
 package/python-trio-websocket/python-trio-websocket.mk          | 2 +-
 package/python-trio/python-trio.mk                              | 2 +-
 package/python-trove-classifiers/python-trove-classifiers.mk    | 2 +-
 package/python-twisted/python-twisted.mk                        | 2 +-
 package/python-txaio/python-txaio.mk                            | 2 +-
 package/python-txdbus/python-txdbus.mk                          | 2 +-
 package/python-txtorcon/python-txtorcon.mk                      | 2 +-
 package/python-typeguard/python-typeguard.mk                    | 2 +-
 package/python-typepy/python-typepy.mk                          | 2 +-
 package/python-types-psutil/python-types-psutil.mk              | 2 +-
 .../python-types-python-dateutil.mk                             | 2 +-
 package/python-types-setuptools/python-types-setuptools.mk      | 2 +-
 package/python-typing-extensions/python-typing-extensions.mk    | 2 +-
 package/python-typing-inspect/python-typing-inspect.mk          | 2 +-
 package/python-typing-inspection/python-typing-inspection.mk    | 2 +-
 package/python-tzlocal/python-tzlocal.mk                        | 2 +-
 package/python-u-msgpack/python-u-msgpack.mk                    | 2 +-
 package/python-ubjson/python-ubjson.mk                          | 2 +-
 package/python-uhid/python-uhid.mk                              | 2 +-
 package/python-ujson/python-ujson.mk                            | 2 +-
 .../python-unittest-xml-reporting.mk                            | 2 +-
 package/python-urllib3/python-urllib3.mk                        | 2 +-
 package/python-urwid-readline/python-urwid-readline.mk          | 2 +-
 package/python-urwid/python-urwid.mk                            | 2 +-
 package/python-uswid/python-uswid.mk                            | 2 +-
 package/python-uvicorn/python-uvicorn.mk                        | 2 +-
 package/python-uvloop/python-uvloop.mk                          | 2 +-
 package/python-validators/python-validators.mk                  | 2 +-
 package/python-versioneer/python-versioneer.mk                  | 2 +-
 package/python-waitress/python-waitress.mk                      | 2 +-
 package/python-watchdog/python-watchdog.mk                      | 2 +-
 package/python-wcwidth/python-wcwidth.mk                        | 2 +-
 package/python-weasyprint/python-weasyprint.mk                  | 2 +-
 package/python-webargs/python-webargs.mk                        | 2 +-
 package/python-webencodings/python-webencodings.mk              | 2 +-
 package/python-webob/python-webob.mk                            | 2 +-
 package/python-websocket-client/python-websocket-client.mk      | 2 +-
 package/python-websockets/python-websockets.mk                  | 2 +-
 package/python-werkzeug/python-werkzeug.mk                      | 2 +-
 package/python-wheel/python-wheel.mk                            | 2 +-
 package/python-whitenoise/python-whitenoise.mk                  | 2 +-
 package/python-wrapt/python-wrapt.mk                            | 2 +-
 package/python-ws4py/python-ws4py.mk                            | 2 +-
 package/python-wsaccel/python-wsaccel.mk                        | 2 +-
 package/python-wsproto/python-wsproto.mk                        | 2 +-
 package/python-wtforms/python-wtforms.mk                        | 2 +-
 package/python-xlib/python-xlib.mk                              | 2 +-
 package/python-xlrd/python-xlrd.mk                              | 2 +-
 package/python-xlsxwriter/python-xlsxwriter.mk                  | 2 +-
 package/python-xlwt/python-xlwt.mk                              | 2 +-
 package/python-xmljson/python-xmljson.mk                        | 2 +-
 package/python-xmltodict/python-xmltodict.mk                    | 2 +-
 package/python-xmodem/python-xmodem.mk                          | 2 +-
 package/python-yamllint/python-yamllint.mk                      | 2 +-
 package/python-yarl/python-yarl.mk                              | 2 +-
 package/python-yatl/python-yatl.mk                              | 2 +-
 package/python-zc-lockfile/python-zc-lockfile.mk                | 2 +-
 package/python-zeroconf/python-zeroconf.mk                      | 2 +-
 package/python-zipstream-ng/python-zipstream-ng.mk              | 2 +-
 package/python-zlmdb/python-zlmdb.mk                            | 2 +-
 package/python-zope-interface/python-zope-interface.mk          | 2 +-
 package/python-zopfli/python-zopfli.mk                          | 2 +-
 package/scons/scons.mk                                          | 2 +-
 package/snmpclitools/snmpclitools.mk                            | 2 +-
 package/supervisor/supervisor.mk                                | 2 +-
 586 files changed, 586 insertions(+), 586 deletions(-)

diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index 8f650de1e7..9d3b6b5040 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CIRCUS_VERSION = 0.16.1
-CIRCUS_SITE = https://files.pythonhosted.org/packages/09/8a/44a0b6b35ecf5dcf22bf51e4bcf188ec9e7ab9dd4c14330ba1b8bea51102
+CIRCUS_SITE = $(call pypi,circus)
 CIRCUS_SETUP_TYPE = setuptools
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 2f59b025fb..bc1b738c1f 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRUDINI_VERSION = 0.9.6
-CRUDINI_SITE = https://files.pythonhosted.org/packages/54/d1/0a363fbbab0aea9e27dd981a602efaf514c45f4fffceac3906274e0425c7
+CRUDINI_SITE = $(call pypi,crudini)
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_DEPENDENCIES = host-python-setuptools-scm
 CRUDINI_LICENSE = GPL-2.0
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 4b59216722..f5aa8d79a0 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AENUM_VERSION = 3.1.16
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/09/7a/61ed58e8be9e30c3fe518899cc78c284896d246d51381bab59b5db11e1f3
+PYTHON_AENUM_SITE = $(call pypi,aenum)
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 916279be78..f0728ad17f 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AERICH_VERSION = 0.9.2
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/c4/60/5d3885f531fab2cecec67510e7b821efc403940ed9eefd034b2c21350f3c
+PYTHON_AERICH_SITE = $(call pypi,aerich)
 PYTHON_AERICH_SETUP_TYPE = pep517
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
diff --git a/package/python-aexpect/python-aexpect.mk b/package/python-aexpect/python-aexpect.mk
index 066f8d0480..5500bb28ca 100644
--- a/package/python-aexpect/python-aexpect.mk
+++ b/package/python-aexpect/python-aexpect.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AEXPECT_VERSION = 1.8.0
 PYTHON_AEXPECT_SOURCE = aexpect-$(PYTHON_AEXPECT_VERSION).tar.gz
-PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/a3/74/837acfcdb3187cb931aa2edc4979e64aa9954092e4fd36b1161f65d65fdb
+PYTHON_AEXPECT_SITE = $(call pypi,aexpect)
 PYTHON_AEXPECT_SETUP_TYPE = setuptools
 PYTHON_AEXPECT_LICENSE = GPL-2.0+
 PYTHON_AEXPECT_LICENSE_FILES = LICENSE
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 7e0cde6c85..d02ccd638f 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOBLESCAN_VERSION = 0.2.14
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/45/15/faf503083bc5a2d81f1b17fbbe30d15f35217b6c5e944c771c8760354d59
+PYTHON_AIOBLESCAN_SITE = $(call pypi,aioblescan)
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index bb08eaf133..46830e4d0c 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOCOAP_VERSION = 0.4.17
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/1d/7c/10483df04d7910e21d55d47ab7c014fb02644b5b58ba741161360f8e9e8d
+PYTHON_AIOCOAP_SITE = $(call pypi,aiocoap)
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 13b0f8eea7..a239db159e 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOCONSOLE_VERSION = 0.8.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/76/4a/71f535c85991e18e1626429a283d4fc6720053f38211affa888809089ded
+PYTHON_AIOCONSOLE_SITE = $(call pypi,aioconsole)
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 6befbff203..a6147595ac 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIODNS_VERSION = 4.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
+PYTHON_AIODNS_SITE = $(call pypi,aiodns)
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index aeabb42d22..d91bf4ff2e 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOFILES_VERSION = 25.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/41/c3/534eac40372d8ee36ef40df62ec129bee4fdb5ad9706e58a29be53b2c970
+PYTHON_AIOFILES_SITE = $(call pypi,aiofiles)
 PYTHON_AIOFILES_SETUP_TYPE = hatch
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 8dcc59a77b..d2cec27a78 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.6.1
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/26/30/f84a107a9c4331c14b2b586036f40965c128aa4fee4dda5d3d51cb14ad54
+PYTHON_AIOHAPPYEYEBALLS_SITE = $(call pypi,aiohappyeyeballs)
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.mk b/package/python-aiohttp-cors/python-aiohttp-cors.mk
index 5e5ae92645..9497fc45cb 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.mk
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_CORS_VERSION = 0.8.1
 PYTHON_AIOHTTP_CORS_SOURCE = aiohttp_cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
-PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/6f/6d/d89e846a5444b3d5eb8985a6ddb0daef3774928e1bfbce8e84ec97b0ffa7
+PYTHON_AIOHTTP_CORS_SITE = $(call pypi,aiohttp_cors)
 PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_CORS_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
index 8eb38e86cc..dc6aba2c28 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.1
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SOURCE = aiohttp-debugtoolbar-$(PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION).tar.gz
-PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/bd/72/cd80c0d1d425d5ef50e5b23553040e8d9fa5de5714208d3d18ae8806b6de
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = $(call pypi,aiohttp-debugtoolbar)
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index efd8c67cff..878a64605f 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_JINJA2_VERSION = 1.6
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/e6/39/da5a94dd89b1af7241fb7fc99ae4e73505b5f898b540b6aba6dc7afe600e
+PYTHON_AIOHTTP_JINJA2_SITE = $(call pypi,aiohttp-jinja2)
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-mako/python-aiohttp-mako.mk b/package/python-aiohttp-mako/python-aiohttp-mako.mk
index 4ff5f89038..138cf6582b 100644
--- a/package/python-aiohttp-mako/python-aiohttp-mako.mk
+++ b/package/python-aiohttp-mako/python-aiohttp-mako.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_MAKO_VERSION = 0.4.0
 PYTHON_AIOHTTP_MAKO_SOURCE = aiohttp-mako-$(PYTHON_AIOHTTP_MAKO_VERSION).tar.gz
-PYTHON_AIOHTTP_MAKO_SITE = https://files.pythonhosted.org/packages/f9/8e/d7c0ea2c74e8102a94021e150b622d274fdef22ebd1f0c9a546b21458931
+PYTHON_AIOHTTP_MAKO_SITE = $(call pypi,aiohttp-mako)
 PYTHON_AIOHTTP_MAKO_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_MAKO_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index 0c3de29e4f..0d2115f170 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_REMOTES_VERSION = 1.3.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/7e/bd/b59c3f8858c3b333b067e2432db95400f1423d7ee6eadfbf4e99a3a30fa3
+PYTHON_AIOHTTP_REMOTES_SITE = $(call pypi,aiohttp_remotes)
 PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = flit
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-security/python-aiohttp-security.mk b/package/python-aiohttp-security/python-aiohttp-security.mk
index 274f60423f..fb7e210497 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.mk
+++ b/package/python-aiohttp-security/python-aiohttp-security.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_SECURITY_VERSION = 0.5.0
 PYTHON_AIOHTTP_SECURITY_SOURCE = aiohttp-security-$(PYTHON_AIOHTTP_SECURITY_VERSION).tar.gz
-PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/31/49/56c131fe3dead875ab5907b154dac7fb6ee727662de80b7da0ff045030d4
+PYTHON_AIOHTTP_SECURITY_SITE = $(call pypi,aiohttp-security)
 PYTHON_AIOHTTP_SECURITY_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SECURITY_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SECURITY_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 1a69e55ca6..598b5988f4 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_SESSION_VERSION = 2.12.1
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp_session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/c2/c4/d73a7f19b1bd3149ba5bccd22e3ab580c19e4d9fcb83114309e8385ab807
+PYTHON_AIOHTTP_SESSION_SITE = $(call pypi,aiohttp_session)
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk
index 4feae517ae..de25dbaac8 100644
--- a/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk
+++ b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_SSE_CLIENT_VERSION = 0.2.1
 PYTHON_AIOHTTP_SSE_CLIENT_SOURCE = aiohttp-sse-client-$(PYTHON_AIOHTTP_SSE_CLIENT_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_CLIENT_SITE = https://files.pythonhosted.org/packages/71/c3/4825c5f37909a70c8018924b3d521847dd7acf1fce7e1054574bafed2271
+PYTHON_AIOHTTP_SSE_CLIENT_SITE = $(call pypi,aiohttp-sse-client)
 PYTHON_AIOHTTP_SSE_CLIENT_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_CLIENT_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_CLIENT_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index bf46c98528..3322ced3df 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_SSE_VERSION = 2.2.0
 PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/80/df/4ddb30e689695fd91cf41c072e154061120ed166e8baf6c9a0020f27dffc
+PYTHON_AIOHTTP_SSE_SITE = $(call pypi,aiohttp-sse)
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 504393c711..5feca29496 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOHTTP_VERSION = 3.13.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/77/9a/152096d4808df8e4268befa55fba462f440f14beab85e8ad9bf990516918
+PYTHON_AIOHTTP_SITE = $(call pypi,aiohttp)
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index e0dff3fbe8..bd047e9985 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOJOBS_VERSION = 1.4.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/03/54/751969398e2039b4dc458fa153dc066a0f7337a5b480d58944f59b7b38ae
+PYTHON_AIOJOBS_SITE = $(call pypi,aiojobs)
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
index bcf60a72e9..02b929e846 100644
--- a/package/python-aiologstash/python-aiologstash.mk
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOLOGSTASH_VERSION = 2.0.0
 PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
-PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
+PYTHON_AIOLOGSTASH_SITE = $(call pypi,aiologstash)
 PYTHON_AIOLOGSTASH_SETUP_TYPE = flit
 PYTHON_AIOLOGSTASH_LICENSE = MIT
 PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 824208ac79..20c71a024d 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOMONITOR_VERSION = 0.7.1
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/28/0a/805797608db4e30ab588b283137b5b2a735655c20df72f2f9bac41da789e
+PYTHON_AIOMONITOR_SITE = $(call pypi,aiomonitor)
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index 53a2125d87..3590a328fe 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOMQTT_VERSION = 2.5.1
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
-PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/70/44/cfc58272783a11729462dc6df5adbfeabd084f840f609054ac772ae98c19
+PYTHON_AIOMQTT_SITE = $(call pypi,aiomqtt)
 PYTHON_AIOMQTT_SETUP_TYPE = hatch
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
index 6cd59ab599..fd1a858006 100644
--- a/package/python-aioprocessing/python-aioprocessing.mk
+++ b/package/python-aioprocessing/python-aioprocessing.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOPROCESSING_VERSION = 2.0.1
 PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
-PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/4d/85/9a75151e7049bf144c01384279201d82d99484bd658f8e6fb013552d8724
+PYTHON_AIOPROCESSING_SITE = $(call pypi,aioprocessing)
 PYTHON_AIOPROCESSING_SETUP_TYPE = flit
 PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
 PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index fbb6e6ff86..5393a40b02 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIORWLOCK_VERSION = 1.5.1
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/6b/65/316cdc82c1b92953235ced1c71a3763f0cd9273c3bec5db60bdb5ad59bfe
+PYTHON_AIORWLOCK_SITE = $(call pypi,aiorwlock)
 PYTHON_AIORWLOCK_SETUP_TYPE = poetry
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index f143558d70..5ec5f7fd1f 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOSIGNAL_VERSION = 1.4.0
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/61/62/06741b579156360248d1ec624842ad0edf697050bbaf7c3e46394e106ad1
+PYTHON_AIOSIGNAL_SITE = $(call pypi,aiosignal)
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index 89fffbeaa7..24a454c16e 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOSQLITE_VERSION = 0.22.1
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/4e/8a/64761f4005f17809769d23e518d915db74e6310474e733e3593cfc854ef1
+PYTHON_AIOSQLITE_SITE = $(call pypi,aiosqlite)
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index 06ea9ef1a4..fbc7336662 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AIOZIPKIN_VERSION = 1.1.1
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/f2/fe/26a60a7c9e91c968eac5dacab2948ed931a676880a6878695ff281c72b8f
+PYTHON_AIOZIPKIN_SITE = $(call pypi,aiozipkin)
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 530b31246f..450cd8e676 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ALEMBIC_VERSION = 1.17.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/02/a6/74c8cadc2882977d80ad756a13857857dbcf9bd405bc80b662eb10651282
+PYTHON_ALEMBIC_SITE = $(call pypi,alembic)
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 4b3276842e..3da8fd0a20 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ALSAAUDIO_VERSION = 0.11.0
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/21/a6/3d833079b030d449345e35ce0e2874e330d3612135734f07b9ceace25bcf
+PYTHON_ALSAAUDIO_SITE = $(call pypi,pyalsaaudio)
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
diff --git a/package/python-aniso8601/python-aniso8601.mk b/package/python-aniso8601/python-aniso8601.mk
index ed0230a0c3..558574c6e5 100644
--- a/package/python-aniso8601/python-aniso8601.mk
+++ b/package/python-aniso8601/python-aniso8601.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ANISO8601_VERSION = 10.0.1
 PYTHON_ANISO8601_SOURCE = aniso8601-$(PYTHON_ANISO8601_VERSION).tar.gz
-PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/8b/8d/52179c4e3f1978d3d9a285f98c706642522750ef343e9738286130423730
+PYTHON_ANISO8601_SITE = $(call pypi,aniso8601)
 PYTHON_ANISO8601_SETUP_TYPE = setuptools
 PYTHON_ANISO8601_LICENSE = BSD-3-Clause
 PYTHON_ANISO8601_LICENSE_FILES = LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
index 2186601a8c..fc878a26a6 100644
--- a/package/python-annotated-doc/python-annotated-doc.mk
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
 PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
-PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SITE = $(call pypi,annotated_doc)
 PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_DOC_LICENSE = MIT
 PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index b962c1a07d..2b53c373af 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
-PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
+PYTHON_ANNOTATED_TYPES_SITE = $(call pypi,annotated_types)
 PYTHON_ANNOTATED_TYPES_SETUP_TYPE = hatch
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
diff --git a/package/python-ansicolors/python-ansicolors.mk b/package/python-ansicolors/python-ansicolors.mk
index 787ce8c40b..589c2da7f1 100644
--- a/package/python-ansicolors/python-ansicolors.mk
+++ b/package/python-ansicolors/python-ansicolors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ANSICOLORS_VERSION = 1.1.8
 PYTHON_ANSICOLORS_SOURCE = ansicolors-$(PYTHON_ANSICOLORS_VERSION).zip
-PYTHON_ANSICOLORS_SITE = https://files.pythonhosted.org/packages/76/31/7faed52088732704523c259e24c26ce6f2f33fbeff2ff59274560c27628e
+PYTHON_ANSICOLORS_SITE = $(call pypi,ansicolors)
 PYTHON_ANSICOLORS_SETUP_TYPE = setuptools
 PYTHON_ANSICOLORS_LICENSE = ISC
 PYTHON_ANSICOLORS_LICENSE_FILES = LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4cd435e265..36211a11e8 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ANYIO_VERSION = 4.13.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
+PYTHON_ANYIO_SITE = $(call pypi,anyio)
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index ddbb211244..27e38667ed 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -6,7 +6,7 @@
 
 PYTHON_APISPEC_VERSION = 6.10.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/4a/f1/1f5a9332df3ecd90cc5ab69bc58a4174b8ba2ac1720c4c26b01d20751bf5
+PYTHON_APISPEC_SITE = $(call pypi,apispec)
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
diff --git a/package/python-appdirs/python-appdirs.mk b/package/python-appdirs/python-appdirs.mk
index 3ecf281db0..94ce9b1a14 100644
--- a/package/python-appdirs/python-appdirs.mk
+++ b/package/python-appdirs/python-appdirs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_APPDIRS_VERSION = 1.4.4
 PYTHON_APPDIRS_SOURCE = appdirs-$(PYTHON_APPDIRS_VERSION).tar.gz
-PYTHON_APPDIRS_SITE = https://files.pythonhosted.org/packages/d7/d8/05696357e0311f5b5c316d7b95f46c669dd9c15aaeecbb48c7d0aeb88c40
+PYTHON_APPDIRS_SITE = $(call pypi,appdirs)
 PYTHON_APPDIRS_SETUP_TYPE = setuptools
 PYTHON_APPDIRS_LICENSE = MIT
 PYTHON_APPDIRS_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index 0b66bb83c2..8c5a3f7b09 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -6,7 +6,7 @@
 
 PYTHON_APSCHEDULER_VERSION = 3.11.2
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/07/12/3e4389e5920b4c1763390c6d371162f3784f86f85cd6d6c1bfe68eef14e2
+PYTHON_APSCHEDULER_SITE = $(call pypi,apscheduler)
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 520c2e5390..ecf84eb135 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ARGCOMPLETE_VERSION = 3.6.3
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/38/61/0b9ae6399dd4a58d8c1b1dc5a27d6f2808023d0b5dd3104bb99f45a33ff6
+PYTHON_ARGCOMPLETE_SITE = $(call pypi,argcomplete)
 PYTHON_ARGCOMPLETE_SETUP_TYPE = hatch
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index cdaa7e4139..f3617b77b7 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ARGH_VERSION = 0.31.3
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/4f/34/bc0b3577a818b4b70c6e318d23fe3c81fc3bb25f978ca8a3965cd8ee3af9
+PYTHON_ARGH_SITE = $(call pypi,argh)
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
index b9a28f6908..95ca9e0eea 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 25.1.0
 PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2_cffi_bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/5c/2d/db8af0df73c1cf454f71b2bbe5e356b8c1f8041c979f505b3d3186e520a9
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = $(call pypi,argon2_cffi_bindings)
 PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index bad4d3ab0f..066db1d51c 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ARGON2_CFFI_VERSION = 25.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2_cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/0e/89/ce5af8a7d472a67cc819d5d998aa8c82c5d860608c4db9f46f1162d7dab9
+PYTHON_ARGON2_CFFI_SITE = $(call pypi,argon2_cffi)
 PYTHON_ARGON2_CFFI_SETUP_TYPE = hatch
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index c12867bf29..c58b95ca8e 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ARROW_VERSION = 1.4.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/b9/33/032cdc44182491aa708d06a68b62434140d8c50820a087fac7af37703357
+PYTHON_ARROW_SITE = $(call pypi,arrow)
 PYTHON_ARROW_SETUP_TYPE = flit
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 392f0a1c1e..7ee1ee379a 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASGIREF_VERSION = 3.11.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/63/40/f03da1264ae8f7cfdbf9146542e5e7e8100a4c66ab48e791df9a03d3f6c0
+PYTHON_ASGIREF_SITE = $(call pypi,asgiref)
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index d8d6176150..8f32d81e73 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASN1CRYPTO_VERSION = 1.5.1
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee
+PYTHON_ASN1CRYPTO_SITE = $(call pypi,asn1crypto)
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 4040a7bb73..fa135a6448 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASTTOKENS_VERSION = 3.0.1
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0
+PYTHON_ASTTOKENS_SITE = $(call pypi,asttokens)
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
diff --git a/package/python-async-generator/python-async-generator.mk b/package/python-async-generator/python-async-generator.mk
index d5e4f430fc..6e078d03cd 100644
--- a/package/python-async-generator/python-async-generator.mk
+++ b/package/python-async-generator/python-async-generator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASYNC_GENERATOR_VERSION = 1.10
 PYTHON_ASYNC_GENERATOR_SOURCE = async_generator-$(PYTHON_ASYNC_GENERATOR_VERSION).tar.gz
-PYTHON_ASYNC_GENERATOR_SITE = https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a
+PYTHON_ASYNC_GENERATOR_SITE = $(call pypi,async_generator)
 PYTHON_ASYNC_GENERATOR_SETUP_TYPE = setuptools
 PYTHON_ASYNC_GENERATOR_LICENSE = Apache-2.0 or MIT
 PYTHON_ASYNC_GENERATOR_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 2825c46053..6d9d9067c2 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASYNC_LRU_VERSION = 2.3.0
 PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/e8/1f/989ecfef8e64109a489fff357450cb73fa73a865a92bd8c272170a6922c2
+PYTHON_ASYNC_LRU_SITE = $(call pypi,async_lru)
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 2835368003..8d492fc909 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.1
 PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a5/ae/136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780
+PYTHON_ASYNC_TIMEOUT_SITE = $(call pypi,async_timeout)
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 32d1eedfa2..8501e29ded 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASYNCCLICK_VERSION = 8.3.0.7
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/f9/ca/25e426d16bd0e91c1c9259112cecd17b2c2c239bdd8e5dba430f3bd5e3ef
+PYTHON_ASYNCCLICK_SITE = $(call pypi,asyncclick)
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 5d4a056d32..89cb7ee7bf 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ASYNCSSH_VERSION = 2.22.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
+PYTHON_ASYNCSSH_SITE = $(call pypi,asyncssh)
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 7456002536..12253c9610 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ATTRS_VERSION = 26.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985
+PYTHON_ATTRS_SITE = $(call pypi,attrs)
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index f110276018..7183f88b64 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AUTOBAHN_VERSION = 25.12.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/d5/9adf0f5b9eb244e58e898e9f3db4b00c09835ef4b6c37d491886e0376b4f
+PYTHON_AUTOBAHN_SITE = $(call pypi,autobahn)
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
diff --git a/package/python-autocommand/python-autocommand.mk b/package/python-autocommand/python-autocommand.mk
index 37b421e418..a3c3b3733a 100644
--- a/package/python-autocommand/python-autocommand.mk
+++ b/package/python-autocommand/python-autocommand.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AUTOCOMMAND_VERSION = 2.2.2
 PYTHON_AUTOCOMMAND_SOURCE = autocommand-$(PYTHON_AUTOCOMMAND_VERSION).tar.gz
-PYTHON_AUTOCOMMAND_SITE = https://files.pythonhosted.org/packages/5b/18/774bddb96bc0dc0a2b8ac2d2a0e686639744378883da0fc3b96a54192d7a
+PYTHON_AUTOCOMMAND_SITE = $(call pypi,autocommand)
 PYTHON_AUTOCOMMAND_SETUP_TYPE = setuptools
 PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0+
 PYTHON_AUTOCOMMAND_LICENSE_FILES = LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 807846b4af..308583c0bf 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -6,7 +6,7 @@
 
 PYTHON_AUTOMAT_VERSION = 25.4.16
 PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/e3/0f/d40bbe294bbf004d436a8bcbcfaadca8b5140d39ad0ad3d73d1a8ba15f14
+PYTHON_AUTOMAT_SITE = $(call pypi,automat)
 PYTHON_AUTOMAT_SETUP_TYPE = hatch
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index f13ea9d2ca..12367ed3fc 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -7,7 +7,7 @@
 # When updating the version, please also update avro-c
 PYTHON_AVRO_VERSION = 1.12.1
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
+PYTHON_AVRO_SITE = $(call pypi,avro)
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 57e372fc1a..4bdb21866c 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BABEL_VERSION = 2.17.0
 PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/6b/d52e42361e1aa00709585ecc30b3f9684b3ab62530771402248b1b1d6240
+PYTHON_BABEL_SITE = $(call pypi,babel)
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
diff --git a/package/python-backcall/python-backcall.mk b/package/python-backcall/python-backcall.mk
index ea9ffb863c..ecda9bc7d9 100644
--- a/package/python-backcall/python-backcall.mk
+++ b/package/python-backcall/python-backcall.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BACKCALL_VERSION = 0.2.0
 PYTHON_BACKCALL_SOURCE = backcall-$(PYTHON_BACKCALL_VERSION).tar.gz
-PYTHON_BACKCALL_SITE = https://files.pythonhosted.org/packages/a2/40/764a663805d84deee23043e1426a9175567db89c8b3287b5c2ad9f71aa93
+PYTHON_BACKCALL_SITE = $(call pypi,backcall)
 PYTHON_BACKCALL_SETUP_TYPE = setuptools
 PYTHON_BACKCALL_LICENSE = BSD-3-Clause
 PYTHON_BACKCALL_LICENSE_FILES = LICENSE
diff --git a/package/python-base58/python-base58.mk b/package/python-base58/python-base58.mk
index 59822c62d7..5c8b23af38 100644
--- a/package/python-base58/python-base58.mk
+++ b/package/python-base58/python-base58.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BASE58_VERSION = 2.1.1
 PYTHON_BASE58_SOURCE = base58-$(PYTHON_BASE58_VERSION).tar.gz
-PYTHON_BASE58_SITE = https://files.pythonhosted.org/packages/7f/45/8ae61209bb9015f516102fa559a2914178da1d5868428bd86a1b4421141d
+PYTHON_BASE58_SITE = $(call pypi,base58)
 PYTHON_BASE58_SETUP_TYPE = setuptools
 PYTHON_BASE58_LICENSE = MIT
 PYTHON_BASE58_LICENSE_FILES = COPYING
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 436312d0ad..2c340e7c6c 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -7,7 +7,7 @@
 PYTHON_BCRYPT_VERSION = 5.0.0
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
 PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/d4/36/3329e2518d70ad8e2e5817d5a4cac6bba05a47767ec416c7d020a965f408
-PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_BCRYPT_SITE = $(call pypi,python-bcrypt)
 PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index a9661345aa..83128acaef 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BEAUTIFULSOUP4_VERSION = 4.14.3
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21
+PYTHON_BEAUTIFULSOUP4_SITE = $(call pypi,beautifulsoup4)
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = hatch
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
index 33d7c03401..66c4d59e80 100644
--- a/package/python-beniget/python-beniget.mk
+++ b/package/python-beniget/python-beniget.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BENIGET_VERSION = 0.5.0
 PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
-PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/31/a9/cf7c2317da1f5034fdebe84555e14a474b3297ef2d03ad148ff02fef2e3a
+PYTHON_BENIGET_SITE = $(call pypi,beniget)
 PYTHON_BENIGET_SETUP_TYPE = setuptools
 PYTHON_BENIGET_LICENSE = BSD-3-Clause
 PYTHON_BENIGET_LICENSE_FILES = LICENSE
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 4fbed23863..8a2ee6f49e 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BETTERPROTO_VERSION = 2.0.0b7
 PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
-PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368fbed92adc897a9a1fae282e3f9d608547dbf805034ca549f381a
+PYTHON_BETTERPROTO_SITE = $(call pypi,betterproto)
 PYTHON_BETTERPROTO_SETUP_TYPE = poetry
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index 9181195d23..e6d70128b0 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BIDICT_VERSION = 0.23.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/9a/6e/026678aa5a830e07cd9498a05d3e7e650a4f56a42f267a53d22bcda1bdc9
+PYTHON_BIDICT_SITE = $(call pypi,bidict)
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index bdfe0494ee..d92982a8a8 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BITARRAY_VERSION = 3.8.1
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/fc/47/b5da717e7bbe97a6dc4c986f053ca55fd3276078d78f68f9e8b417d1425a
+PYTHON_BITARRAY_SITE = $(call pypi,bitarray)
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 0642d6d6ec..385bea25eb 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BITSTRING_VERSION = 4.4.0
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/36/d3/de6fe4e7065df8c2f1ac1766f5fdccbe75bc18af2cf2dbeecd34d68e1518
+PYTHON_BITSTRING_SITE = $(call pypi,bitstring)
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index e873d1234f..22c22108ba 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BLEAK_VERSION = 3.0.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/9f/dd19d92309e4a37823210827f0f42460e69603254309b99499622b511294
+PYTHON_BLEAK_SITE = $(call pypi,bleak)
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index a5949e117b..95be060a53 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BLINKER_VERSION = 1.9.0
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/21/28/9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce
+PYTHON_BLINKER_SITE = $(call pypi,blinker)
 PYTHON_BLINKER_SETUP_TYPE = flit
 PYTHON_BLINKER_LICENSE = MIT
 PYTHON_BLINKER_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 071085c644..70a1e3e6a2 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BLUEZERO_VERSION = 0.9.1
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/ca/09/2aec91949397d15acb794648d65646e27f0e9f999a0da962e73023198663
+PYTHON_BLUEZERO_SITE = $(call pypi,bluezero)
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 4a88e115cf..323935e8bb 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BOTO3_VERSION = 1.43.1
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/98/36/028c12ed6ed85009a21b5472eb76c27f9b0341c6986f06f83475b40aaf51
+PYTHON_BOTO3_SITE = $(call pypi,boto3)
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index ff892c60f8..d3285cbf52 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BOTOCORE_VERSION = 1.43.1
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/03/b7/416ae6f1461d6fec3b3aaffc4759371319c71a21f7ab4c3106ee574fda8d
+PYTHON_BOTOCORE_SITE = $(call pypi,botocore)
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 01a73514ad..63a908da08 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BOTTLE_VERSION = 0.13.4
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7a/71/cca6167c06d00c81375fd668719df245864076d284f7cb46a694cbeb5454
+PYTHON_BOTTLE_SITE = $(call pypi,bottle)
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index e2343a24b2..74cb3372ff 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BROTLI_VERSION = 1.2.0
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
+PYTHON_BROTLI_SITE = $(call pypi,brotli)
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 1b10b63913..22ab053058 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -6,7 +6,7 @@
 
 PYTHON_BSDIFF4_VERSION = 1.2.6
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c
+PYTHON_BSDIFF4_SITE = $(call pypi,bsdiff4)
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
index eb5c68b173..7298946afc 100644
--- a/package/python-cached-property/python-cached-property.mk
+++ b/package/python-cached-property/python-cached-property.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CACHED_PROPERTY_VERSION = 2.0.1
 PYTHON_CACHED_PROPERTY_SOURCE = cached_property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
-PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb
+PYTHON_CACHED_PROPERTY_SITE = $(call pypi,cached_property)
 PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
 PYTHON_CACHED_PROPERTY_LICENSE = BSD-3-Clause
 PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
index 937925e1e3..dab5aa08c9 100644
--- a/package/python-cachelib/python-cachelib.mk
+++ b/package/python-cachelib/python-cachelib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CACHELIB_VERSION = 0.14.0
 PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
-PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/66/a5/5eb041dbee71766704d44cf5dfb6950ab018be0fd02cd763ade09869e33c
+PYTHON_CACHELIB_SITE = $(call pypi,cachelib)
 PYTHON_CACHELIB_SETUP_TYPE = flit
 PYTHON_CACHELIB_LICENSE = BSD-3-Clause
 PYTHON_CACHELIB_LICENSE_FILES = LICENSE.txt docs/license.rst
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 0804e0f2a5..dcee502587 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CACHETOOLS_VERSION = 6.2.4
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/bc/1d/ede8680603f6016887c062a2cf4fc8fdba905866a3ab8831aa8aa651320c
+PYTHON_CACHETOOLS_SITE = $(call pypi,cachetools)
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
index ca3d9d4dbb..6b773ceca4 100644
--- a/package/python-calver/python-calver.mk
+++ b/package/python-calver/python-calver.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CALVER_VERSION = 2025.10.20
 PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
-PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/4a/96/0c57e3e228ffc54074867406b659b197678674f1f0bf600d114965289834
+PYTHON_CALVER_SITE = $(call pypi,calver)
 PYTHON_CALVER_SETUP_TYPE = setuptools
 PYTHON_CALVER_LICENSE = Apache-2.0
 PYTHON_CALVER_LICENSE_FILES = LICENSE
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index c1f27d6709..82c74b01c7 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CAN_VERSION = 4.6.1
 PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/74/f9/a9d99d36dd33be5badb747801c9255c3c526171a5542092eaacc73350fb8
+PYTHON_CAN_SITE = $(call pypi,python_can)
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index b36acf8c0b..8e3b71a760 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CANOPEN_VERSION = 2.4.1
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/be/ea/f2654cb432988dfe9ab93140ff502f7e2e7eaa1835e8aaa4ee5a935af736
+PYTHON_CANOPEN_SITE = $(call pypi,canopen)
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 859ee4a1b5..b4ff20e8d5 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CBOR2_VERSION = 5.9.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
+PYTHON_CBOR2_SITE = $(call pypi,cbor2)
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 53a17f6732..9b0a82e878 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CCHARDET_VERSION = 2.1.7
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b7988a9433246c9cf0b566b1ae1374368cfb8ac897218a4f65
+PYTHON_CCHARDET_SITE = $(call pypi,cchardet)
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 474b147873..616759889f 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CERTIFI_VERSION = 2026.4.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
+PYTHON_CERTIFI_SITE = $(call pypi,certifi)
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index ab9068b101..13ed9ec45b 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CFFI_VERSION = 2.0.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846
+PYTHON_CFFI_SITE = $(call pypi,cffi)
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT-0
diff --git a/package/python-changelog-chug/python-changelog-chug.mk b/package/python-changelog-chug/python-changelog-chug.mk
index ae5ed7287d..78c9452cfd 100644
--- a/package/python-changelog-chug/python-changelog-chug.mk
+++ b/package/python-changelog-chug/python-changelog-chug.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHANGELOG_CHUG_VERSION = 0.0.3
 PYTHON_CHANGELOG_CHUG_SOURCE = changelog_chug-$(PYTHON_CHANGELOG_CHUG_VERSION).tar.gz
-PYTHON_CHANGELOG_CHUG_SITE = https://files.pythonhosted.org/packages/fc/6d/f08e0f600f88c69923c692d486096ca7d2eae5d657516ec134fb45ed0ab0
+PYTHON_CHANGELOG_CHUG_SITE = $(call pypi,changelog_chug)
 PYTHON_CHANGELOG_CHUG_SETUP_TYPE = setuptools
 PYTHON_CHANGELOG_CHUG_LICENSE = AGPL-3.0+
 PYTHON_CHANGELOG_CHUG_LICENSE_FILES = COPYING
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index d651383127..50077e7b4d 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHANNELS_REDIS_VERSION = 4.3.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/ab/69/fd3407ad407a80e72ca53850eb7a4c306273e67d5bbb71a86d0e6d088439
+PYTHON_CHANNELS_REDIS_SITE = $(call pypi,channels_redis)
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 77b2ea8def..562a8bc0cc 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHANNELS_VERSION = 4.3.2
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/74/92/b18d4bb54d14986a8b35215a1c9e6a7f9f4d57ca63ac9aee8290ebb4957d
+PYTHON_CHANNELS_SITE = $(call pypi,channels)
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
index dd081eacef..4d46105dbd 100644
--- a/package/python-characteristic/python-characteristic.mk
+++ b/package/python-characteristic/python-characteristic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARACTERISTIC_VERSION = 14.3.0
 PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
-PYTHON_CHARACTERISTIC_SITE = https://files.pythonhosted.org/packages/dc/66/54b7a4758ea44fbc93895c7745060005272560fb2c356f2a6f7448ef9a80
+PYTHON_CHARACTERISTIC_SITE = $(call pypi,characteristic)
 PYTHON_CHARACTERISTIC_LICENSE = MIT
 PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
 PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 16e5f303b6..84c27dd4d3 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARDET_VERSION = 5.2.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079
+PYTHON_CHARDET_SITE = $(call pypi,chardet)
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index ce91028b31..fc6b5bdffd 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.5
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24
+PYTHON_CHARSET_NORMALIZER_SITE = $(call pypi,charset_normalizer)
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 92688f6ced..46b2268a03 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHEETAH_VERSION = 3.2.6.post2
 PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
+PYTHON_CHEETAH_SITE = $(call pypi,Cheetah3)
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 4bd382ad65..1ac52e3acb 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHEROOT_VERSION = 11.1.2
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/68/e4/5c2020b60a55aca8d79ed55b62ad1cd7fc47ea44ad6b584e83f5f1bf58b0
+PYTHON_CHEROOT_SITE = $(call pypi,cheroot)
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 1f995ed1df..02f1ab6af3 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHERRYPY_VERSION = 18.10.0
 PYTHON_CHERRYPY_SOURCE = cherrypy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/93/e8/2f7ef142d1962d08a8885c4c9942212abecad6a80ccdd1620fd1f5c993fd
+PYTHON_CHERRYPY_SITE = $(call pypi,cherrypy)
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 6f63a4df8f..36e49615e9 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CLICK_VERSION = 8.3.3
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718
+PYTHON_CLICK_SITE = $(call pypi,click)
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-cloudpickle/python-cloudpickle.mk b/package/python-cloudpickle/python-cloudpickle.mk
index 9f74783667..005c387a0b 100644
--- a/package/python-cloudpickle/python-cloudpickle.mk
+++ b/package/python-cloudpickle/python-cloudpickle.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CLOUDPICKLE_VERSION = 3.1.2
 PYTHON_CLOUDPICKLE_SOURCE = cloudpickle-$(PYTHON_CLOUDPICKLE_VERSION).tar.gz
-PYTHON_CLOUDPICKLE_SITE = https://files.pythonhosted.org/packages/27/fb/576f067976d320f5f0114a8d9fa1215425441bb35627b1993e5afd8111e5
+PYTHON_CLOUDPICKLE_SITE = $(call pypi,cloudpickle)
 PYTHON_CLOUDPICKLE_SETUP_TYPE = flit
 PYTHON_CLOUDPICKLE_LICENSE = BSD-3-Clause
 PYTHON_CLOUDPICKLE_LICENSE_FILES = LICENSE
diff --git a/package/python-coherent-licensed/python-coherent-licensed.mk b/package/python-coherent-licensed/python-coherent-licensed.mk
index f827610046..ab0e7bd513 100644
--- a/package/python-coherent-licensed/python-coherent-licensed.mk
+++ b/package/python-coherent-licensed/python-coherent-licensed.mk
@@ -6,7 +6,7 @@
 
 PYTHON_COHERENT_LICENSED_VERSION = 0.5.2
 PYTHON_COHERENT_LICENSED_SOURCE = coherent_licensed-$(PYTHON_COHERENT_LICENSED_VERSION).tar.gz
-PYTHON_COHERENT_LICENSED_SITE = https://files.pythonhosted.org/packages/cd/e9/63d2dcccb5496cc99d96f29a8a5f3e2c6ed0bba7fedb840862f92816ee17
+PYTHON_COHERENT_LICENSED_SITE = $(call pypi,coherent_licensed)
 PYTHON_COHERENT_LICENSED_SETUP_TYPE = flit
 PYTHON_COHERENT_LICENSED_LICENSE = MIT
 PYTHON_COHERENT_LICENSED_LICENSE_FILES = LICENSE
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index e87c60afb9..6ec39e1eaf 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -6,7 +6,7 @@
 
 PYTHON_COLORAMA_VERSION = 0.4.6
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
-PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
+PYTHON_COLORAMA_SITE = $(call pypi,colorama)
 PYTHON_COLORAMA_SETUP_TYPE = hatch
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 1b03c3eb19..e5580dbda0 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -6,7 +6,7 @@
 
 PYTHON_COLORLOG_VERSION = 6.10.1
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a2/61/f083b5ac52e505dfc1c624eafbf8c7589a0d7f32daa398d2e7590efa5fda
+PYTHON_COLORLOG_SITE = $(call pypi,colorlog)
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
index 0ed6a90c61..0ca6c80a9d 100644
--- a/package/python-colorzero/python-colorzero.mk
+++ b/package/python-colorzero/python-colorzero.mk
@@ -6,7 +6,7 @@
 
 PYTHON_COLORZERO_VERSION = 2.0
 PYTHON_COLORZERO_SOURCE = colorzero-$(PYTHON_COLORZERO_VERSION).tar.gz
-PYTHON_COLORZERO_SITE = https://files.pythonhosted.org/packages/b3/ca/688824a06e8c4d04c7d2fd2af2d8da27bed51af20ee5f094154e1d680334
+PYTHON_COLORZERO_SITE = $(call pypi,colorzero)
 PYTHON_COLORZERO_LICENSE = BSD-3-Clause
 PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
 PYTHON_COLORZERO_SETUP_TYPE = setuptools
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
index 963bbcb2b8..1b27502a81 100644
--- a/package/python-configobj/python-configobj.mk
+++ b/package/python-configobj/python-configobj.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CONFIGOBJ_VERSION = 5.0.9
 PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
-PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/f5/c4/c7f9e41bc2e5f8eeae4a08a01c91b2aea3dfab40a3e14b25e87e7db8d501
+PYTHON_CONFIGOBJ_SITE = $(call pypi,configobj)
 PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
 PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
 PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 466c9bf455..ea74ed2f44 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CONSTANTLY_VERSION = 23.10.4
 PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://files.pythonhosted.org/packages/4d/6f/cb2a94494ff74aa9528a36c5b1422756330a75a8367bf20bd63171fc324d
+PYTHON_CONSTANTLY_SITE = $(call pypi,constantly)
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
index 46cae959ea..a7667f749a 100644
--- a/package/python-construct/python-construct.mk
+++ b/package/python-construct/python-construct.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CONSTRUCT_VERSION = 2.10.70
 PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
-PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f
+PYTHON_CONSTRUCT_SITE = $(call pypi,construct)
 PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
 PYTHON_CONSTRUCT_LICENSE = MIT
 PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 4fe04f5f71..2a04d05602 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CONTOURPY_VERSION = 1.3.3
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a
+PYTHON_CONTOURPY_SITE = $(call pypi,contourpy)
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
diff --git a/package/python-couchdb/python-couchdb.mk b/package/python-couchdb/python-couchdb.mk
index b88c65703d..732127b5c0 100644
--- a/package/python-couchdb/python-couchdb.mk
+++ b/package/python-couchdb/python-couchdb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_COUCHDB_VERSION = 1.2
 PYTHON_COUCHDB_SOURCE = CouchDB-$(PYTHON_COUCHDB_VERSION).tar.gz
-PYTHON_COUCHDB_SITE = https://files.pythonhosted.org/packages/7c/c8/f94a107eca0c178e5d74c705dad1a5205c0f580840bd1b155cd8a258cb7c
+PYTHON_COUCHDB_SITE = $(call pypi,CouchDB)
 PYTHON_COUCHDB_SETUP_TYPE = setuptools
 PYTHON_COUCHDB_LICENSE = BSD-3-Clause
 PYTHON_COUCHDB_LICENSE_FILES = COPYING
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index 28b77963f7..bc6491fa35 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CPPY_VERSION = 1.3.1
 PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
-PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/45/ed/b35645a1b285bce356f30cc0fe77a042375c385660ccd61e0cdc4c1f7c44
+PYTHON_CPPY_SITE = $(call pypi,cppy)
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
diff --git a/package/python-crayons/python-crayons.mk b/package/python-crayons/python-crayons.mk
index 33562d097b..f0402c1b89 100644
--- a/package/python-crayons/python-crayons.mk
+++ b/package/python-crayons/python-crayons.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRAYONS_VERSION = 0.4.0
 PYTHON_CRAYONS_SOURCE = crayons-$(PYTHON_CRAYONS_VERSION).tar.gz
-PYTHON_CRAYONS_SITE = https://files.pythonhosted.org/packages/b8/6b/12a1dea724c82f1c19f410365d3e25356625b48e8009a7c3c9ec4c42488d
+PYTHON_CRAYONS_SITE = $(call pypi,crayons)
 PYTHON_CRAYONS_LICENSE = MIT
 PYTHON_CRAYONS_LICENSE_FILES = LICENSE
 PYTHON_CRAYONS_SETUP_TYPE = setuptools
diff --git a/package/python-crc/python-crc.mk b/package/python-crc/python-crc.mk
index afee463092..5d4a491a4b 100644
--- a/package/python-crc/python-crc.mk
+++ b/package/python-crc/python-crc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRC_VERSION = 7.1.0
 PYTHON_CRC_SOURCE = crc-$(PYTHON_CRC_VERSION).tar.gz
-PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025
+PYTHON_CRC_SITE = $(call pypi,crc)
 PYTHON_CRC_SETUP_TYPE = poetry
 PYTHON_CRC_LICENSE = BSD-2-Clause
 PYTHON_CRC_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 7a773eaf8e..b64f631df3 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRC16_VERSION = 0.1.1
 PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
-PYTHON_CRC16_SITE = https://files.pythonhosted.org/packages/a6/e0/70a44c4385f2b33df82e518005aae16b5c1feaf082c73c0acebe3426fc0a
+PYTHON_CRC16_SITE = $(call pypi,crc16)
 PYTHON_CRC16_LICENSE = LGPL-3.0+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = setuptools
diff --git a/package/python-crccheck/python-crccheck.mk b/package/python-crccheck/python-crccheck.mk
index 32c1341d32..f4a148d55b 100644
--- a/package/python-crccheck/python-crccheck.mk
+++ b/package/python-crccheck/python-crccheck.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRCCHECK_VERSION = 1.3.1
 PYTHON_CRCCHECK_SOURCE = crccheck-$(PYTHON_CRCCHECK_VERSION).tar.gz
-PYTHON_CRCCHECK_SITE = https://files.pythonhosted.org/packages/3c/d1/a943f4f1ca899917cc3fe1cb89d59348edd1b407503e4b02608e8d6b421e
+PYTHON_CRCCHECK_SITE = $(call pypi,crccheck)
 PYTHON_CRCCHECK_LICENSE = MIT
 PYTHON_CRCCHECK_LICENSE_FILES = LICENSE.txt
 PYTHON_CRCCHECK_SETUP_TYPE = setuptools
diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index a8f2e86be6..21195361f6 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
-PYTHON_CRCMOD_SITE = https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
+PYTHON_CRCMOD_SITE = $(call pypi,crcmod)
 PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 248ffca405..d731973f10 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRONTAB_VERSION = 3.3.0
 PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/99/7f/c54fb7e70b59844526aa4ae321e927a167678660ab51dda979955eafb89a
+PYTHON_CRONTAB_SITE = $(call pypi,python_crontab)
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index bb4a5084cc..e7520afac1 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -7,7 +7,7 @@
 PYTHON_CRYPTOGRAPHY_VERSION = 48.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/a9/db8f313fdcd85d767d4973515e1db101f9c71f95fced83233de224673757
-PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_CRYPTOGRAPHY_SITE = $(call pypi,python-cryptography)
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index d58aea52a8..9cc3df7f65 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CSSSELECT_VERSION = 1.4.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6
+PYTHON_CSSSELECT_SITE = $(call pypi,cssselect)
 PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 3644bdca18..54a863aaf7 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CSSSELECT2_VERSION = 0.9.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1
+PYTHON_CSSSELECT2_SITE = $(call pypi,cssselect2)
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 9b7a93ddd0..a9b5d2d3c5 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CSSUTILS_VERSION = 2.15.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/01/00/7e89107ea389e952eea73b1b90ac6633e15a519c4a518ee90bb93a2f83dc
+PYTHON_CSSUTILS_SITE = $(call pypi,cssutils)
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = LICENSE
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index df7abdf927..d0a4ab75df 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CYCLER_VERSION = 0.12.1
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
-PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8
+PYTHON_CYCLER_SITE = $(call pypi,cycler)
 PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 50e2e6e1cc..29f3d224f8 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CYTHON_VERSION = 3.1.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
+PYTHON_CYTHON_SITE = $(call pypi,cython)
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index ef380bfe3b..4e2903d305 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DAEMON_VERSION = 3.1.2
 PYTHON_DAEMON_SOURCE = python_daemon-$(PYTHON_DAEMON_VERSION).tar.gz
-PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/3d/37/4f10e37bdabc058a32989da2daf29e57dc59dbc5395497f3d36d5f5e2694
+PYTHON_DAEMON_SITE = $(call pypi,python_daemon)
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
diff --git a/package/python-daemonize/python-daemonize.mk b/package/python-daemonize/python-daemonize.mk
index de146bf8de..8939b77b74 100644
--- a/package/python-daemonize/python-daemonize.mk
+++ b/package/python-daemonize/python-daemonize.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DAEMONIZE_VERSION = 2.5.0
 PYTHON_DAEMONIZE_SOURCE = daemonize-$(PYTHON_DAEMONIZE_VERSION).tar.gz
-PYTHON_DAEMONIZE_SITE = https://files.pythonhosted.org/packages/8c/20/96f7dbc23812cfe4cf479c87af3e4305d0d115fd1fffec32ddeee7b9c82b
+PYTHON_DAEMONIZE_SITE = $(call pypi,daemonize)
 PYTHON_DAEMONIZE_SETUP_TYPE = setuptools
 PYTHON_DAEMONIZE_LICENSE = MIT
 PYTHON_DAEMONIZE_LICENSE_FILES = LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 69f5a9f466..9d2cf6da6c 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DAPHNE_VERSION = 4.2.1
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/cd/9d/322b605fdc03b963cf2d33943321c8f4405e8d82e698bf49d1eed1ca40c4
+PYTHON_DAPHNE_SITE = $(call pypi,daphne)
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 060de7cab5..e487425c5a 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DATAPROPERTY_VERSION = 1.1.0
 PYTHON_DATAPROPERTY_SOURCE = dataproperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/0b/81/8c8b64ae873cb9014815214c07b63b12e3b18835780fb342223cfe3fe7d8
+PYTHON_DATAPROPERTY_SITE = $(call pypi,dataproperty)
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index a2f1620b9f..50017a2f9e 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_DATEUTIL_VERSION = 2.9.0
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/d9/77/bd458a2e387e98f71de86dcc2ca2cab64489736004c80bc12b70da8b5488
+PYTHON_DATEUTIL_SITE = $(call pypi,python-dateutil)
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 91c6679e1d..58756110ae 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DBUS_FAST_VERSION = 5.0.14
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7f/6b/d4c8871e772ddf73e76bfd725dbb6fa82eb11492b370b423892016f0e579
+PYTHON_DBUS_FAST_SITE = $(call pypi,dbus_fast)
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
diff --git a/package/python-dbus-next/python-dbus-next.mk b/package/python-dbus-next/python-dbus-next.mk
index f35a32cb3a..27d536d635 100644
--- a/package/python-dbus-next/python-dbus-next.mk
+++ b/package/python-dbus-next/python-dbus-next.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DBUS_NEXT_VERSION = 0.2.3
 PYTHON_DBUS_NEXT_SOURCE = dbus_next-$(PYTHON_DBUS_NEXT_VERSION).tar.gz
-PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/ce/45/6a40fbe886d60a8c26f480e7d12535502b5ba123814b3b9a0b002ebca198
+PYTHON_DBUS_NEXT_SITE = $(call pypi,dbus_next)
 PYTHON_DBUS_NEXT_SETUP_TYPE = setuptools
 PYTHON_DBUS_NEXT_LICENSE = MIT
 PYTHON_DBUS_NEXT_LICENSE_FILES = LICENSE
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index d08696e773..48e506900a 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DECORATOR_VERSION = 5.2.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b
+PYTHON_DECORATOR_SITE = $(call pypi,decorator)
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
diff --git a/package/python-decouple/python-decouple.mk b/package/python-decouple/python-decouple.mk
index c0d0cdb909..ef65fce1e2 100644
--- a/package/python-decouple/python-decouple.mk
+++ b/package/python-decouple/python-decouple.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_DECOUPLE_VERSION = 3.8
-PYTHON_DECOUPLE_SITE = https://files.pythonhosted.org/packages/e1/97/373dcd5844ec0ea5893e13c39a2c67e7537987ad8de3842fe078db4582fa
+PYTHON_DECOUPLE_SITE = $(call pypi,python-decouple)
 PYTHON_DECOUPLE_SETUP_TYPE = setuptools
 PYTHON_DECOUPLE_LICENSE = MIT
 PYTHON_DECOUPLE_LICENSE_FILES = LICENSE
diff --git a/package/python-defusedxml/python-defusedxml.mk b/package/python-defusedxml/python-defusedxml.mk
index 19ba2fda68..2e0b572809 100644
--- a/package/python-defusedxml/python-defusedxml.mk
+++ b/package/python-defusedxml/python-defusedxml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DEFUSEDXML_VERSION = 0.7.1
 PYTHON_DEFUSEDXML_SOURCE = defusedxml-$(PYTHON_DEFUSEDXML_VERSION).tar.gz
-PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72
+PYTHON_DEFUSEDXML_SITE = $(call pypi,defusedxml)
 PYTHON_DEFUSEDXML_SETUP_TYPE = setuptools
 PYTHON_DEFUSEDXML_LICENSE = Python-2.0
 PYTHON_DEFUSEDXML_LICENSE_FILES = LICENSE
diff --git a/package/python-deprecation/python-deprecation.mk b/package/python-deprecation/python-deprecation.mk
index 8a9b9b7c90..cf54b4a5c6 100644
--- a/package/python-deprecation/python-deprecation.mk
+++ b/package/python-deprecation/python-deprecation.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DEPRECATION_VERSION = 2.1.0
 PYTHON_DEPRECATION_SOURCE = deprecation-$(PYTHON_DEPRECATION_VERSION).tar.gz
-PYTHON_DEPRECATION_SITE = https://files.pythonhosted.org/packages/source/d/deprecation
+PYTHON_DEPRECATION_SITE = $(call pypi,deprecation)
 PYTHON_DEPRECATION_SETUP_TYPE = setuptools
 PYTHON_DEPRECATION_LICENSE = Apache-2.0
 PYTHON_DEPRECATION_LICENSE_FILES = LICENSE
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index e936de5811..0d2382ff43 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DIALOG3_VERSION = 3.5.3
 PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.gz
-PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/4e/40/5c84d79f7d536ca2c3722af521eff4faafe54a93797f08c72eb72e68fb68
+PYTHON_DIALOG3_SITE = $(call pypi,pythondialog)
 PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
 PYTHON_DIALOG3_SETUP_TYPE = setuptools
diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
index 569f923a9a..4abee4a29d 100644
--- a/package/python-dictdiffer/python-dictdiffer.mk
+++ b/package/python-dictdiffer/python-dictdiffer.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DICTDIFFER_VERSION = 0.9.0
 PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
-PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
+PYTHON_DICTDIFFER_SITE = $(call pypi,dictdiffer)
 PYTHON_DICTDIFFER_SETUP_TYPE = setuptools
 PYTHON_DICTDIFFER_LICENSE = MIT
 PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index eb0049fd03..ae12c52e1a 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DICTTOXML_VERSION = 1.7.16
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/ee/c9/3132427f9e64d572688e6a1cbe3d542d1a03f676b81fb600f3d1fd7d2ec5
+PYTHON_DICTTOXML_SITE = $(call pypi,dicttoxml)
 PYTHON_DICTTOXML_SETUP_TYPE = setuptools
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
diff --git a/package/python-dicttoxml2/python-dicttoxml2.mk b/package/python-dicttoxml2/python-dicttoxml2.mk
index d2abe63860..b6f674d731 100644
--- a/package/python-dicttoxml2/python-dicttoxml2.mk
+++ b/package/python-dicttoxml2/python-dicttoxml2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DICTTOXML2_VERSION = 2.1.0
 PYTHON_DICTTOXML2_SOURCE = dicttoxml2-$(PYTHON_DICTTOXML2_VERSION).tar.gz
-PYTHON_DICTTOXML2_SITE = https://files.pythonhosted.org/packages/0b/24/7a6d37b2770843e34685e470fd711955cb0f77c354c73d8ca64b02420bce
+PYTHON_DICTTOXML2_SITE = $(call pypi,dicttoxml2)
 PYTHON_DICTTOXML2_SETUP_TYPE = setuptools
 PYTHON_DICTTOXML2_LICENSE = GPL-2.0
 PYTHON_DICTTOXML2_LICENSE_FILES = LICENCE.txt
diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
index 70b53469d8..991a735367 100644
--- a/package/python-diskcache/python-diskcache.mk
+++ b/package/python-diskcache/python-diskcache.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DISKCACHE_VERSION = 5.6.3
 PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
-PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
+PYTHON_DISKCACHE_SITE = $(call pypi,diskcache)
 PYTHON_DISKCACHE_SETUP_TYPE = setuptools
 PYTHON_DISKCACHE_LICENSE = Apache-2.0
 PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index d71896237d..9dace2cecf 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DISTLIB_VERSION = 0.4.0
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/96/8e/709914eb2b5749865801041647dc7f4e6d00b549cfe88b65ca192995f07c
+PYTHON_DISTLIB_SITE = $(call pypi,distlib)
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index 05faab3888..d4c757edc8 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DISTRO_VERSION = 1.9.0
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3
+PYTHON_DISTRO_SITE = $(call pypi,distro)
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
 PYTHON_DISTRO_SETUP_TYPE = setuptools
diff --git a/package/python-django-enumfields/python-django-enumfields.mk b/package/python-django-enumfields/python-django-enumfields.mk
index 20abb5bf6a..75246579bb 100644
--- a/package/python-django-enumfields/python-django-enumfields.mk
+++ b/package/python-django-enumfields/python-django-enumfields.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DJANGO_ENUMFIELDS_VERSION = 2.1.1
 PYTHON_DJANGO_ENUMFIELDS_SOURCE = django-enumfields-$(PYTHON_DJANGO_ENUMFIELDS_VERSION).tar.gz
-PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/24/a8/aaf2b5ddb697c9bcab53c32cfebe11e536502e07c30646b4756e7214b685
+PYTHON_DJANGO_ENUMFIELDS_SITE = $(call pypi,django-enumfields)
 PYTHON_DJANGO_ENUMFIELDS_SETUP_TYPE = setuptools
 PYTHON_DJANGO_ENUMFIELDS_LICENSE = MIT
 PYTHON_DJANGO_ENUMFIELDS_LICENSE_FILES = LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fe88128e24..1e22f20a66 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DJANGO_VERSION = 6.0.5
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
+PYTHON_DJANGO_SITE = $(call pypi,django)
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index da3cf223fd..6e412007b5 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DNSPYTHON_VERSION = 2.8.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26
+PYTHON_DNSPYTHON_SITE = $(call pypi,dnspython)
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = hatch
diff --git a/package/python-docker-pycreds/python-docker-pycreds.mk b/package/python-docker-pycreds/python-docker-pycreds.mk
index 6575ada084..38f4376e6c 100644
--- a/package/python-docker-pycreds/python-docker-pycreds.mk
+++ b/package/python-docker-pycreds/python-docker-pycreds.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKER_PYCREDS_VERSION = 0.4.0
 PYTHON_DOCKER_PYCREDS_SOURCE = docker-pycreds-$(PYTHON_DOCKER_PYCREDS_VERSION).tar.gz
-PYTHON_DOCKER_PYCREDS_SITE = https://files.pythonhosted.org/packages/c5/e6/d1f6c00b7221e2d7c4b470132c931325c8b22c51ca62417e300f5ce16009
+PYTHON_DOCKER_PYCREDS_SITE = $(call pypi,docker-pycreds)
 PYTHON_DOCKER_PYCREDS_SETUP_TYPE = setuptools
 PYTHON_DOCKER_PYCREDS_LICENSE = Apache-2.0
 PYTHON_DOCKER_PYCREDS_LICENSE_FILES = LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 582d9ee1d0..f29ad6e69d 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKER_VERSION = 7.1.0
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
+PYTHON_DOCKER_SITE = $(call pypi,docker)
 PYTHON_DOCKER_SETUP_TYPE = hatch
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
index 7ad98c6b94..0397da5386 100644
--- a/package/python-dockerpty/python-dockerpty.mk
+++ b/package/python-dockerpty/python-dockerpty.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKERPTY_VERSION = 0.4.1
 PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
-PYTHON_DOCKERPTY_SITE = https://files.pythonhosted.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
+PYTHON_DOCKERPTY_SITE = $(call pypi,dockerpty)
 PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
 PYTHON_DOCKERPTY_LICENSE = Apache-2.0
 PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index bad9ce56af..9abb5858cc 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCUTILS_VERSION = 0.22.4
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8
+PYTHON_DOCUTILS_SITE = $(call pypi,docutils)
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index d6301af9db..ca05ea5eab 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOMINATE_VERSION = 2.9.1
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/fb/f3/1c8088ff19a0fcd9c3234802a0ee47006ea64bd8852f1019194f0e3583ff
+PYTHON_DOMINATE_SITE = $(call pypi,dominate)
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 6ebc4f6c8c..1ebc6fdd59 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOTENV_VERSION = 1.2.1
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9
+PYTHON_DOTENV_SITE = $(call pypi,python_dotenv)
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index a99a1e8604..6e0d9682d2 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DPKT_VERSION = 1.9.8
 PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/c9/7d/52f17a794db52a66e46ebb0c7549bf2f035ed61d5a920ba4aaa127dd038e
+PYTHON_DPKT_SITE = $(call pypi,dpkt)
 PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index d61592004a..c50009ec23 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DTSCHEMA_VERSION = 2026.4
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f8/f0/3990f821c088a6107ce1ca1906fd123aebf3c2a0a4c82cb41d7d52664bc3
+PYTHON_DTSCHEMA_SITE = $(call pypi,dtschema)
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index c94cc0512d..b7da6c9018 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ECDSA_VERSION = 0.19.1
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f471eae4b26bd13b698f6af2c44279f67af317439c2f4c46a
+PYTHON_ECDSA_SITE = $(call pypi,ecdsa)
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
index 116aa228d5..2eefdcfc27 100644
--- a/package/python-editables/python-editables.mk
+++ b/package/python-editables/python-editables.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EDITABLES_VERSION = 0.6
 PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
-PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/82/f8/02a4e9a0cb961b0feeb431ac96b231c157ecdcbbeacafe9e2fdb4b1dde39
+PYTHON_EDITABLES_SITE = $(call pypi,editables)
 PYTHON_EDITABLES_LICENSE = MIT
 PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
 PYTHON_EDITABLES_SETUP_TYPE = setuptools
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
index e54387869b..a64e5b045b 100644
--- a/package/python-email-validator/python-email-validator.mk
+++ b/package/python-email-validator/python-email-validator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EMAIL_VALIDATOR_VERSION = 2.3.0
 PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
-PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/f5/22/900cb125c76b7aaa450ce02fd727f452243f2e91a61af068b40adba60ea9
+PYTHON_EMAIL_VALIDATOR_SITE = $(call pypi,email_validator)
 PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
 PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
index 603e58fe7c..5f2096b323 100644
--- a/package/python-emailproxy/python-emailproxy.mk
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EMAILPROXY_VERSION = 2025.10.4
 PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
-PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/4f/0d/045028f891c4a83ea7d616a81f0b9af8d290316eb0c958d572b6445232f9
+PYTHON_EMAILPROXY_SITE = $(call pypi,emailproxy)
 PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
 PYTHON_EMAILPROXY_LICENSE = Apache-2.0
 PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 76ae166970..eff120de09 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ENGINEIO_VERSION = 4.13.0
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/42/5a/349caac055e03ef9e56ed29fa304846063b1771ee54ab8132bf98b29491e
+PYTHON_ENGINEIO_SITE = $(call pypi,python_engineio)
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
index 287b83605d..b150088d5a 100644
--- a/package/python-entrypoints/python-entrypoints.mk
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ENTRYPOINTS_VERSION = 0.4
 PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
-PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/ea/8d/a7121ffe5f402dc015277d2d31eb82d2187334503a011c18f2e78ecbb9b2
+PYTHON_ENTRYPOINTS_SITE = $(call pypi,entrypoints)
 PYTHON_ENTRYPOINTS_SETUP_TYPE = flit
 PYTHON_ENTRYPOINTS_LICENSE = MIT
 PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index eda9d024c6..0cab2b8341 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ESPTOOL_VERSION = 5.1.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/c2/03/d7d79a77dd787dbe6029809c5f81ad88912340a131c88075189f40df3aba
+PYTHON_ESPTOOL_SITE = $(call pypi,esptool)
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 169055ab27..81524fbb5d 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EVDEV_VERSION = 1.9.3
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/a5/f5/397b61091120a9ca5001041dd7bf76c385b3bfd67a0e5bcb74b852bd22a4
+PYTHON_EVDEV_SITE = $(call pypi,evdev)
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index 0545941d5e..7928817317 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EXECUTING_VERSION = 2.2.1
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d
+PYTHON_EXECUTING_SITE = $(call pypi,executing)
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
index 33dc09e181..b06064a08c 100644
--- a/package/python-expandvars/python-expandvars.mk
+++ b/package/python-expandvars/python-expandvars.mk
@@ -6,7 +6,7 @@
 
 PYTHON_EXPANDVARS_VERSION = 1.1.2
 PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
-PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/9c/64/a9d8ea289d663a44b346203a24bf798507463db1e76679eaa72ee6de1c7a
+PYTHON_EXPANDVARS_SITE = $(call pypi,expandvars)
 PYTHON_EXPANDVARS_SETUP_TYPE = hatch
 PYTHON_EXPANDVARS_LICENSE = MIT
 PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index e6ad8f5d80..81a0d1602d 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FALCON_VERSION = 4.2.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/ba/15/5a4d8d62e8b338d2ec4430965b51b592695e859d0c6bf104afa1ce927eed
+PYTHON_FALCON_SITE = $(call pypi,falcon)
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
diff --git a/package/python-farama-notifications/python-farama-notifications.mk b/package/python-farama-notifications/python-farama-notifications.mk
index 14759d3b1d..bd66700950 100644
--- a/package/python-farama-notifications/python-farama-notifications.mk
+++ b/package/python-farama-notifications/python-farama-notifications.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.6
 PYTHON_FARAMA_NOTIFICATIONS_SOURCE = farama_notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
-PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/ec/91/14397890dde30adc4bee6462158933806207bc5dd10d7b4d09d5c33845cf
+PYTHON_FARAMA_NOTIFICATIONS_SITE = $(call pypi,farama_notifications)
 PYTHON_FARAMA_NOTIFICATIONS_SETUP_TYPE = setuptools
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE = MIT
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE_FILES = LICENSE
diff --git a/package/python-fastapi-sessions/python-fastapi-sessions.mk b/package/python-fastapi-sessions/python-fastapi-sessions.mk
index abfb41b5b6..296f44adf0 100644
--- a/package/python-fastapi-sessions/python-fastapi-sessions.mk
+++ b/package/python-fastapi-sessions/python-fastapi-sessions.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FASTAPI_SESSIONS_VERSION = 0.3.2
 PYTHON_FASTAPI_SESSIONS_SOURCE = fastapi-sessions-$(PYTHON_FASTAPI_SESSIONS_VERSION).tar.gz
-PYTHON_FASTAPI_SESSIONS_SITE = https://files.pythonhosted.org/packages/1d/89/da83ba47bd70101e14eca0ac57c7f300b055b70104446badfdc1dcbe813f
+PYTHON_FASTAPI_SESSIONS_SITE = $(call pypi,fastapi-sessions)
 PYTHON_FASTAPI_SESSIONS_SETUP_TYPE = setuptools
 PYTHON_FASTAPI_SESSIONS_LICENSE = MIT
 PYTHON_FASTAPI_SESSIONS_LICENSE_FILES = LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 60e0a83369..01397f494c 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FASTAPI_VERSION = 0.136.3
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/81/2d/ff8d91d7b564d464629a0fd50a4489c97fcb836ac230bf3a7269232a9b1f
+PYTHON_FASTAPI_SITE = $(call pypi,fastapi)
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
diff --git a/package/python-fastentrypoints/python-fastentrypoints.mk b/package/python-fastentrypoints/python-fastentrypoints.mk
index 7fa728929d..e6c3570f15 100644
--- a/package/python-fastentrypoints/python-fastentrypoints.mk
+++ b/package/python-fastentrypoints/python-fastentrypoints.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FASTENTRYPOINTS_VERSION = 0.12
 PYTHON_FASTENTRYPOINTS_SOURCE = fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
-PYTHON_FASTENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/56/59/69d9ae590ca39435d409651314ec13b2abe8127c1db0231c01d034ebb6b0
+PYTHON_FASTENTRYPOINTS_SITE = $(call pypi,fastentrypoints)
 PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools
 PYTHON_FASTENTRYPOINTS_LICENSE = BSD-2-Clause
 PYTHON_FASTENTRYPOINTS_LICENSE_FILES = fastentrypoints.py
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index 82906b1b79..227df090af 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FASTUI_VERSION = 0.9.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
-PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/c4/27/e52de3e3a3dd16cda6fac11d2b5b0ed8a54e14386a303bc8f757275df121
+PYTHON_FASTUI_SITE = $(call pypi,fastui)
 PYTHON_FASTUI_SETUP_TYPE = hatch
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index b7a4638775..45675a3c07 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FILELOCK_VERSION = 3.29.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/b5/fe/997687a931ab51049acce6fa1f23e8f01216374ea81374ddee763c493db5
+PYTHON_FILELOCK_SITE = $(call pypi,filelock)
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 7f035493b8..6454a77272 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FIRE_VERSION = 0.7.1
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/c0/00/f8d10588d2019d6d6452653def1ee807353b21983db48550318424b5ff18
+PYTHON_FIRE_SITE = $(call pypi,fire)
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 33444c71e0..154077588f 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_BABEL_VERSION = 4.0.0
 PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/58/1a/4c65e3b90bda699a637bfb7fb96818b0a9bbff7636ea91aade67f6020a31
+PYTHON_FLASK_BABEL_SITE = $(call pypi,flask_babel)
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = poetry
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
index 0b32c87055..f4989a387c 100644
--- a/package/python-flask-caching/python-flask-caching.mk
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_CACHING_VERSION = 2.4.0
 PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
-PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/42/53/5c46b6a80adc13ed9179879a93cfc2c1f190c64c48ba732b4f5819df520e
+PYTHON_FLASK_CACHING_SITE = $(call pypi,flask_caching)
 PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
 PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
 PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 5049371956..537c17dd23 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_CORS_VERSION = 6.0.2
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/70/74/0fc0fa68d62f21daef41017dafab19ef4b36551521260987eb3a5394c7ba
+PYTHON_FLASK_CORS_SITE = $(call pypi,flask_cors)
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
index 55c9bc9571..8d9a2d4b32 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.mk
+++ b/package/python-flask-expects-json/python-flask-expects-json.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.7.0
 PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
-PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/12/a5/b27cf21d62c2b5a0a32e2f92bde9658e74c34fcc2e004bb0d591f1bf7627
+PYTHON_FLASK_EXPECTS_JSON_SITE = $(call pypi,flask-expects-json)
 PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
 PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
 PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index 34e7b7ad98..cda55b8146 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_JSONRPC_VERSION = 4.0.0
 PYTHON_FLASK_JSONRPC_SOURCE = flask_jsonrpc-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/b9/2e/74dcb729aa2f5b49d4731cfaab5cb5fbfd867906ba7a0a6e32c66779dbb6
+PYTHON_FLASK_JSONRPC_SITE = $(call pypi,flask_jsonrpc)
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE.txt
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = hatch
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index ed10c98f5a..16d43c4bd2 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_LOGIN_VERSION = 0.6.3
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/c3/6e/2f4e13e373bb49e68c02c51ceadd22d172715a06716f9299d9df01b6ddb2
+PYTHON_FLASK_LOGIN_SITE = $(call pypi,Flask-Login)
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
diff --git a/package/python-flask-restx/python-flask-restx.mk b/package/python-flask-restx/python-flask-restx.mk
index f8e8ef133a..b9ad17c1d8 100644
--- a/package/python-flask-restx/python-flask-restx.mk
+++ b/package/python-flask-restx/python-flask-restx.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_RESTX_VERSION = 1.3.2
 PYTHON_FLASK_RESTX_SOURCE = flask-restx-$(PYTHON_FLASK_RESTX_VERSION).tar.gz
-PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/43/89/9b9ca58cbb8e9ec46f4a510ba93878e0c88d518bf03c350e3b1b7ad85cbe
+PYTHON_FLASK_RESTX_SITE = $(call pypi,flask-restx)
 PYTHON_FLASK_RESTX_SETUP_TYPE = setuptools
 PYTHON_FLASK_RESTX_LICENSE = BSD-3-Clause
 PYTHON_FLASK_RESTX_LICENSE_FILES = LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 34b3f81b38..9e5a887c41 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_SMOREST_VERSION = 0.47.0
 PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/99/b0/5edd5f3231ea26b52e786588c45d786df26929d2be8fec634bcb871b2a3f
+PYTHON_FLASK_SMOREST_SITE = $(call pypi,flask_smorest)
 PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index 2ee53d4b00..ca3c751e3e 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_SQLALCHEMY_VERSION = 3.1.1
 PYTHON_FLASK_SQLALCHEMY_SOURCE = flask_sqlalchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/91/53/b0a9fcc1b1297f51e68b69ed3b7c3c40d8c45be1391d77ae198712914392
+PYTHON_FLASK_SQLALCHEMY_SITE = $(call pypi,flask_sqlalchemy)
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 5a52c9d4c9..3371100af5 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_WTF_VERSION = 1.3.0
 PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/91/f1/605a56d4ea217b307f3e6f4d663e0351253d85d841edc93ba559f0648e19
+PYTHON_FLASK_WTF_SITE = $(call pypi,flask_wtf)
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = hatch
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 70994189c5..06d307b869 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_VERSION = 3.1.3
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/26/00/35d85dcce6c57fdc871f3867d465d780f302a175ea360f62533f12b27e2b
+PYTHON_FLASK_SITE = $(call pypi,flask)
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index 8b9c06df52..1dbc91fcac 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLATBUFFERS_VERSION = 25.9.23
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/9d/1f/3ee70b0a55137442038f2a33469cc5fddd7e0ad2abf83d7497c18a2b6923
+PYTHON_FLATBUFFERS_SITE = $(call pypi,flatbuffers)
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index ee958cece5..59e4611ab2 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLIT_CORE_VERSION = 3.12.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/69/59/b6fc2188dfc7ea4f936cd12b49d707f66a1cb7a1d2c16172963534db741b
+PYTHON_FLIT_CORE_SITE = $(call pypi,flit_core)
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
index 2ea6a1a32e..786d58254d 100644
--- a/package/python-flup/python-flup.mk
+++ b/package/python-flup/python-flup.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLUP_VERSION = 1.0.3
 PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
-PYTHON_FLUP_SITE = https://files.pythonhosted.org/packages/bb/b5/26cc8f7baf0ddebd3e61a354a2bcc692cfe8005123c37ee3d8507c4c7511
+PYTHON_FLUP_SITE = $(call pypi,flup)
 PYTHON_FLUP_LICENSE = BSD-2-Clause, MIT
 PYTHON_FLUP_LICENSE_FILES = PKG-INFO
 PYTHON_FLUP_SETUP_TYPE = setuptools
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 1eb8224197..9fe3a4236c 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FONTTOOLS_VERSION = 4.62.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/9a/08/7012b00a9a5874311b639c3920270c36ee0c445b69d9989a85e5c92ebcb0
+PYTHON_FONTTOOLS_SITE = $(call pypi,fonttools)
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index b0d408d836..a657bdce5b 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FROZENLIST_VERSION = 1.8.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/2d/f5/c831fac6cc817d26fd54c7eaccd04ef7e0288806943f7cc5bbf69f3ac1f0
+PYTHON_FROZENLIST_SITE = $(call pypi,frozenlist)
 PYTHON_FROZENLIST_SETUP_TYPE = pep517
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
diff --git a/package/python-fs/python-fs.mk b/package/python-fs/python-fs.mk
index 8d684e6ebd..6a41823c69 100644
--- a/package/python-fs/python-fs.mk
+++ b/package/python-fs/python-fs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FS_VERSION = 2.4.16
 PYTHON_FS_SOURCE = fs-$(PYTHON_FS_VERSION).tar.gz
-PYTHON_FS_SITE = https://files.pythonhosted.org/packages/5d/a9/af5bfd5a92592c16cdae5c04f68187a309be8a146b528eac3c6e30edbad2
+PYTHON_FS_SITE = $(call pypi,fs)
 PYTHON_FS_SETUP_TYPE = setuptools
 PYTHON_FS_LICENSE = MIT
 PYTHON_FS_LICENSE_FILES = LICENSE
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 6276440c40..b0bfb32727 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FUTURE_VERSION = 1.0.0
 PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
-PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a66432916b26158687e821ba631a4c9273c474343badf84d3ba
+PYTHON_FUTURE_SITE = $(call pypi,future)
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index e40e5a7f05..1259226f4c 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GAST_VERSION = 0.7.0
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/91/f6/e73969782a2ecec280f8a176f2476149dd9dba69d5f8779ec6108a7721e6
+PYTHON_GAST_SITE = $(call pypi,gast)
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 49cd04f66c..6e5bbced59 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GIT_VERSION = 3.1.46
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b
+PYTHON_GIT_SITE = $(call pypi,gitpython)
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 55ec0fc6d5..1fe924aad4 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GITDB2_VERSION = 4.0.12
 PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a
+PYTHON_GITDB2_SITE = $(call pypi,gitdb)
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index 55c57cb702..6f08c695be 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GNUPG_VERSION = 0.5.6
 PYTHON_GNUPG_SOURCE = python_gnupg-$(PYTHON_GNUPG_VERSION).tar.gz
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/2c/6cd2c7cff4bdbb434be5429ef6b8e96ee6b50155551361f30a1bb2ea3c1d
+PYTHON_GNUPG_SITE = $(call pypi,python_gnupg)
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index f77548efd4..0ec9787f2d 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GOOGLE_API_CORE_VERSION = 2.30.3
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/16/ce/502a57fb0ec752026d24df1280b162294b22a0afb98a326084f9a979138b
+PYTHON_GOOGLE_API_CORE_SITE = $(call pypi,google_api_core)
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 8e54c52f49..bfb2124649 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GOOGLE_AUTH_VERSION = 2.49.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ea/80/6a696a07d3d3b0a92488933532f03dbefa4a24ab80fb231395b9a2a1be77
+PYTHON_GOOGLE_AUTH_SITE = $(call pypi,google_auth)
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 5fd2513d1a..2bb1aff3a5 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.74.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/20/18/a746c8344152d368a5aac738d4c857012f2c5d1fd2eac7e17b647a7861bd
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = $(call pypi,googleapis_common_protos)
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 6881f0df43..2addb10851 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GPIOD_VERSION = 2.4.2
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
+PYTHON_GPIOD_SITE = $(call pypi,gpiod)
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
 PYTHON_GPIOD_LICENSE_FILES = LICENSE
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index cc06abc118..1f1d525c44 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GPIOZERO_VERSION = 2.0.1
 PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
-PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/e4/47/334b8db8a981eca9a0fb1e7e48e1997a5eaa8f40bb31c504299dcca0e6ff
+PYTHON_GPIOZERO_SITE = $(call pypi,gpiozero)
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index bf8181b0b3..fdd24b492b 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GREENLET_VERSION = 3.5.0
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/3c/3f/dbf99fb14bfeb88c28f16729215478c0e265cacd6dc22270c8f31bb6892f
+PYTHON_GREENLET_SITE = $(call pypi,greenlet)
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
index 1830c4dbab..375a6cf49a 100644
--- a/package/python-grpc-requests/python-grpc-requests.mk
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GRPC_REQUESTS_VERSION = 0.1.21
 PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
-PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/97/58/7e2be40bad0964f7d6f1c11f72be941c19575ab426c10e1b97e17aa1e42f
+PYTHON_GRPC_REQUESTS_SITE = $(call pypi,grpc_requests)
 PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
 PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index b79ef083f7..71d3a04262 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GRPCIO_REFLECTION_VERSION = 1.76.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/10/767f9c2719c435616141efb3371f6e158f95cdde36a34876ae1d08ba7440
+PYTHON_GRPCIO_REFLECTION_SITE = $(call pypi,grpcio_reflection)
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index af9817a0ef..c1c6e634f5 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GRPCIO_VERSION = 1.76.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
+PYTHON_GRPCIO_SITE = $(call pypi,grpcio)
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
index 70a0824e64..debf8eb889 100644
--- a/package/python-grpclib/python-grpclib.mk
+++ b/package/python-grpclib/python-grpclib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GRPCLIB_VERSION = 0.4.9
 PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
-PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/5b/28/5a2c299ec82a876a252c5919aa895a6f1d1d35c96417c5ce4a4660dc3a80
+PYTHON_GRPCLIB_SITE = $(call pypi,grpclib)
 PYTHON_GRPCLIB_SETUP_TYPE = setuptools
 PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
 PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index 8e3b87fd51..ab8a325fd9 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GUNICORN_VERSION = 23.0.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/34/72/9614c465dc206155d93eff0ca20d42e1e35afc533971379482de953521a4
+PYTHON_GUNICORN_SITE = $(call pypi,gunicorn)
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
index dd5ca59f30..9f20f4660d 100644
--- a/package/python-gymnasium/python-gymnasium.mk
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -6,7 +6,7 @@
 
 PYTHON_GYMNASIUM_VERSION = 1.3.0
 PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
-PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/4d/ff/14b6880d703dfaca204490979d3254ccd280c99550798993319902873658
+PYTHON_GYMNASIUM_SITE = $(call pypi,gymnasium)
 PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
 PYTHON_GYMNASIUM_LICENSE = MIT
 PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
index 4e4685ea5a..c3d9dfecd9 100644
--- a/package/python-h11/python-h11.mk
+++ b/package/python-h11/python-h11.mk
@@ -6,7 +6,7 @@
 
 PYTHON_H11_VERSION = 0.16.0
 PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
-PYTHON_H11_SITE = https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963
+PYTHON_H11_SITE = $(call pypi,h11)
 PYTHON_H11_SETUP_TYPE = setuptools
 PYTHON_H11_LICENSE = MIT
 PYTHON_H11_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index d9cfbdbf92..44f0feef9a 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_H2_VERSION = 4.3.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/1d/17/afa56379f94ad0fe8defd37d6eb3f89a25404ffc71d4d848893d270325fc
+PYTHON_H2_SITE = $(call pypi,h2)
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 5e658239b1..ca417741e2 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HATCH_FANCY_PYPI_README_VERSION = 25.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/f3/0f/aed57c301f339936eb91cb4d8c1e5088a101081854bd3ec18a889df32365
+PYTHON_HATCH_FANCY_PYPI_README_SITE = $(call pypi,hatch_fancy_pypi_readme)
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index 1fc2a19706..6210e1f1f4 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HATCH_VCS_VERSION = 0.5.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/6b/b0/4cc743d38adbee9d57d786fa496ed1daadb17e48589b6da8fa55717a0746
+PYTHON_HATCH_VCS_SITE = $(call pypi,hatch_vcs)
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = hatch
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index e82cb8d5b4..7804628de3 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HATCHLING_VERSION = 1.29.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/cf/9c/b4cfe330cd4f49cff17fd771154730555fa4123beb7f292cf0098b4e6c20
+PYTHON_HATCHLING_SITE = $(call pypi,hatchling)
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
index 29943d618c..adbf4d8662 100644
--- a/package/python-hid/python-hid.mk
+++ b/package/python-hid/python-hid.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HID_VERSION = 1.0.9
 PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
-PYTHON_HID_SITE = https://files.pythonhosted.org/packages/e9/f8/0357a8aa8874a243e96d08a8568efaf7478293e1a3441ddca18039b690c1
+PYTHON_HID_SITE = $(call pypi,hid)
 PYTHON_HID_SETUP_TYPE = setuptools
 PYTHON_HID_LICENSE = MIT
 PYTHON_HID_LICENSE_FILES = LICENSE
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index a722f2eab9..ef9c61e0e5 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HIREDIS_VERSION = 3.3.1
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/97/d6/9bef6dc3052c168c93fbf7e6c0f2b12c45f0f741a2d30fd919096774343a
+PYTHON_HIREDIS_SITE = $(call pypi,hiredis)
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
diff --git a/package/python-hkdf/python-hkdf.mk b/package/python-hkdf/python-hkdf.mk
index 8b68c5cc9f..51b4a14f98 100644
--- a/package/python-hkdf/python-hkdf.mk
+++ b/package/python-hkdf/python-hkdf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HKDF_VERSION = 0.0.3
 PYTHON_HKDF_SOURCE = hkdf-$(PYTHON_HKDF_VERSION).tar.gz
-PYTHON_HKDF_SITE = https://files.pythonhosted.org/packages/c3/be/327e072850db181ce56afd51e26ec7aa5659b18466c709fa5ea2548c935f
+PYTHON_HKDF_SITE = $(call pypi,hkdf)
 PYTHON_HKDF_SETUP_TYPE = setuptools
 # No license file in the tree, but
 # https://github.com/casebeer/python-hkdf/blob/master/LICENSE shows
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 2655a6b4ad..34dea3e4be 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HPACK_VERSION = 4.1.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/2c/48/71de9ed269fdae9c8057e5a4c0aa7402e8bb16f2c6e90b3aa53327b113f8
+PYTHON_HPACK_SITE = $(call pypi,hpack)
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 320ef01c7a..ee7ae26c0a 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HTML5LIB_VERSION = 1.1
 PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2
+PYTHON_HTML5LIB_SITE = $(call pypi,html5lib)
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index 957641916a..82c47d3e01 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HTTPCORE_VERSION = 1.0.9
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb
+PYTHON_HTTPCORE_SITE = $(call pypi,httpcore)
 PYTHON_HTTPCORE_SETUP_TYPE = hatch
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ea5b8e0008..4fb0e47b7d 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HTTPLIB2_VERSION = 0.31.2
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c1/1f/e86365613582c027dda5ddb64e1010e57a3d53e99ab8a72093fa13d565ec
+PYTHON_HTTPLIB2_SITE = $(call pypi,httplib2)
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index aef46a33bf..d435a7c215 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HTTPX_VERSION = 0.28.1
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956
+PYTHON_HTTPX_SITE = $(call pypi,httpx)
 PYTHON_HTTPX_SETUP_TYPE = hatch
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
diff --git a/package/python-huepy/python-huepy.mk b/package/python-huepy/python-huepy.mk
index cca3c3429e..4c1e2f96f8 100644
--- a/package/python-huepy/python-huepy.mk
+++ b/package/python-huepy/python-huepy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HUEPY_VERSION = 1.2.1
 PYTHON_HUEPY_SOURCE = huepy-$(PYTHON_HUEPY_VERSION).tar.gz
-PYTHON_HUEPY_SITE = https://files.pythonhosted.org/packages/d6/4e/2dae447d8858a31158ca6c313f5d1902bc83b8542bb5f10c0307de2973bc
+PYTHON_HUEPY_SITE = $(call pypi,huepy)
 PYTHON_HUEPY_LICENSE = GPL-3.0
 PYTHON_HUEPY_LICENSE_FILES = LICENSE
 PYTHON_HUEPY_SETUP_TYPE = setuptools
diff --git a/package/python-humanfriendly/python-humanfriendly.mk b/package/python-humanfriendly/python-humanfriendly.mk
index fcf3b47924..c7bd7ec2cc 100644
--- a/package/python-humanfriendly/python-humanfriendly.mk
+++ b/package/python-humanfriendly/python-humanfriendly.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HUMANFRIENDLY_VERSION = 10.0
 PYTHON_HUMANFRIENDLY_SOURCE = humanfriendly-$(PYTHON_HUMANFRIENDLY_VERSION).tar.gz
-PYTHON_HUMANFRIENDLY_SITE = https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43
+PYTHON_HUMANFRIENDLY_SITE = $(call pypi,humanfriendly)
 
 PYTHON_HUMANFRIENDLY_LICENSE = MIT
 PYTHON_HUMANFRIENDLY_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index e314fa5f78..03ab92cc00 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HUMANIZE_VERSION = 4.15.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/ba/66/a3921783d54be8a6870ac4ccffcd15c4dc0dd7fcce51c6d63b8c63935276
+PYTHON_HUMANIZE_SITE = $(call pypi,humanize)
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
diff --git a/package/python-hwdata/python-hwdata.mk b/package/python-hwdata/python-hwdata.mk
index c277eebccc..bc9a9a02b0 100644
--- a/package/python-hwdata/python-hwdata.mk
+++ b/package/python-hwdata/python-hwdata.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HWDATA_VERSION = 2.4.1
 PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
-PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/ff/ec/4a6e57d765a63f7e9a8c5348f0bf3f7d39243dc5bc695fa1e887ca5856c8
+PYTHON_HWDATA_SITE = $(call pypi,hwdata)
 PYTHON_HWDATA_SETUP_TYPE = setuptools
 PYTHON_HWDATA_LICENSE = GPL-2.0+
 PYTHON_HWDATA_LICENSE_FILES = LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 3ebbf4cee5..c99b0a5cef 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HYPERFRAME_VERSION = 6.1.0
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/02/e7/94f8232d4a74cc99514c13a9f995811485a6903d48e5d952771ef6322e30
+PYTHON_HYPERFRAME_SITE = $(call pypi,hyperframe)
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index a80c555450..48d14b5e5f 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -6,7 +6,7 @@
 
 PYTHON_HYPERLINK_VERSION = 21.0.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/3a/51/1947bd81d75af87e3bb9e34593a4cf118115a8feb451ce7a69044ef1412e
+PYTHON_HYPERLINK_SITE = $(call pypi,hyperlink)
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
 PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
diff --git a/package/python-ibmiotf/python-ibmiotf.mk b/package/python-ibmiotf/python-ibmiotf.mk
index 62ffba5b0f..1603b8f935 100644
--- a/package/python-ibmiotf/python-ibmiotf.mk
+++ b/package/python-ibmiotf/python-ibmiotf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IBMIOTF_VERSION = 0.4.0
 PYTHON_IBMIOTF_SOURCE = ibmiotf-$(PYTHON_IBMIOTF_VERSION).tar.gz
-PYTHON_IBMIOTF_SITE = https://files.pythonhosted.org/packages/78/05/029ca6f78b788a3c55157fd11bb63922d002d75df982ffb8243f450a750e
+PYTHON_IBMIOTF_SITE = $(call pypi,ibmiotf)
 PYTHON_IBMIOTF_SETUP_TYPE = setuptools
 PYTHON_IBMIOTF_LICENSE = EPL-1.0
 PYTHON_IBMIOTF_LICENSE_FILES = LICENSE
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 2b654a480c..38a20148f2 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IDNA_VERSION = 3.11
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60
+PYTHON_IDNA_SITE = $(call pypi,idna)
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
index 9b7d50d825..ec8cffe1f5 100644
--- a/package/python-ifaddr/python-ifaddr.mk
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IFADDR_VERSION = 0.2.0
 PYTHON_IFADDR_SOURCE = ifaddr-$(PYTHON_IFADDR_VERSION).tar.gz
-PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791
+PYTHON_IFADDR_SITE = $(call pypi,ifaddr)
 PYTHON_IFADDR_SETUP_TYPE = setuptools
 PYTHON_IFADDR_LICENSE = MIT
 PYTHON_IFADDR_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 1e8cbd7e7b..1072aff528 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IMMUTABLEDICT_VERSION = 4.3.1
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
-PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/1d/e6/718471048fea0366c3e3d1df3acfd914ca66d571cdffcf6d37bbcd725708
+PYTHON_IMMUTABLEDICT_SITE = $(call pypi,immutabledict)
 PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index e8717db294..3266c06ca9 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INCREMENTAL_VERSION = 24.11.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/ef/3c/82e84109e02c492f382c711c58a3dd91badda6d746def81a1465f74dc9f5
+PYTHON_INCREMENTAL_SITE = $(call pypi,incremental)
 PYTHON_INCREMENTAL_SETUP_TYPE = hatch
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index 21e87aea35..8ec0c97ad1 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INFLECT_VERSION = 7.5.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/78/c6/943357d44a21fd995723d07ccaddd78023eace03c1846049a2645d4324a3
+PYTHON_INFLECT_SITE = $(call pypi,inflect)
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 7c030e99b9..960ef1189d 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INFLECTION_VERSION = 0.5.1
 PYTHON_INFLECTION_SOURCE = inflection-$(PYTHON_INFLECTION_VERSION).tar.gz
-PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7329bc8d54edbf0ec22fbfb2afe61facb681f9aaa9bff7a27d04
+PYTHON_INFLECTION_SITE = $(call pypi,inflection)
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index 47bc0e7d20..001eda2d91 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INFLUXDB_VERSION = 5.3.2
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/12/d4/4c1bd3a8f85403fad3137a7e44f7882b0366586b7c27d12713493516f1c7
+PYTHON_INFLUXDB_SITE = $(call pypi,influxdb)
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 68392aaa10..27074d8bbe 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INICONFIG_VERSION = 2.3.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10
+PYTHON_INICONFIG_SITE = $(call pypi,iniconfig)
 PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 05c9b3930f..a6222d145a 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INIPARSE_VERSION = 0.5
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
+PYTHON_INIPARSE_SITE = $(call pypi,iniparse)
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 22b79ec464..09ffaf8d82 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INSTALLER_VERSION = 1.0.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/5f/ef/230b70e66db6ab01d5cbb93329688ed1f06b2b0618a74925e36384ff0fba
+PYTHON_INSTALLER_SITE = $(call pypi,installer)
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
index cc8b973f0f..07d58ed2d5 100644
--- a/package/python-intelhex/python-intelhex.mk
+++ b/package/python-intelhex/python-intelhex.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INTELHEX_VERSION = 2.3.0
 PYTHON_INTELHEX_SOURCE = intelhex-$(PYTHON_INTELHEX_VERSION).tar.gz
-PYTHON_INTELHEX_SITE = https://files.pythonhosted.org/packages/66/37/1e7522494557d342a24cb236e2aec5d078fac8ed03ad4b61372586406b01
+PYTHON_INTELHEX_SITE = $(call pypi,intelhex)
 PYTHON_INTELHEX_SETUP_TYPE = setuptools
 PYTHON_INTELHEX_LICENSE = BSD-3-Clause
 PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index d7738c7eb4..662a54a2e1 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
-PYTHON_IOWAIT_SITE = https://files.pythonhosted.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
+PYTHON_IOWAIT_SITE = $(call pypi,iowait)
 PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index 71f70be5d4..ec610f6cc6 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPDB_VERSION = 0.13.13
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/3d/1b/7e07e7b752017f7693a0f4d41c13e5ca29ce8cbcfdcc1fd6c4ad8c0a27a0
+PYTHON_IPDB_SITE = $(call pypi,ipdb)
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 21698a0458..fe108d170a 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPTABLES_VERSION = 1.2.0
 PYTHON_IPTABLES_SOURCE = python_iptables-$(PYTHON_IPTABLES_VERSION).tar.gz
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/55/3c/a2626b88fffb5bcebae80a2dca1e09ff539ab454a8e5fb2e50141943a1f8
+PYTHON_IPTABLES_SITE = $(call pypi,python_iptables)
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index ec03adcb60..fc81f8500f 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPY_VERSION = 1.01
 PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
+PYTHON_IPY_SITE = $(call pypi,IPy)
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = setuptools
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
index 847279b6b4..81752b3224 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.mk
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
 PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
-PYTHON_IPYTHON_GENUTILS_SITE = https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_SITE = $(call pypi,ipython_genutils)
 PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
 PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
diff --git a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
index e86284b265..570102c3de 100644
--- a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
+++ b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION = 1.1.1
 PYTHON_IPYTHON_PYGMENTS_LEXERS_SOURCE = ipython_pygments_lexers-$(PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION).tar.gz
-PYTHON_IPYTHON_PYGMENTS_LEXERS_SITE = https://files.pythonhosted.org/packages/ef/4c/5dd1d8af08107f88c7f741ead7a40854b8ac24ddf9ae850afbcf698aa552
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SITE = $(call pypi,ipython_pygments_lexers)
 PYTHON_IPYTHON_PYGMENTS_LEXERS_SETUP_TYPE = flit
 PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE_FILES = LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 8af5b3c312..fd1af11ad7 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_VERSION = 9.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/12/51/a703c030f4928646d390b4971af4938a1b10c9dfce694f0d99a0bb073cb2
+PYTHON_IPYTHON_SITE = $(call pypi,ipython)
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 3676e9e93e..145e649be5 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ISO8601_VERSION = 2.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15
+PYTHON_ISO8601_SITE = $(call pypi,iso8601)
 PYTHON_ISO8601_SETUP_TYPE = poetry
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
diff --git a/package/python-isodate/python-isodate.mk b/package/python-isodate/python-isodate.mk
index 3f61dfd6b4..a0dc5ad116 100644
--- a/package/python-isodate/python-isodate.mk
+++ b/package/python-isodate/python-isodate.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ISODATE_VERSION = 0.7.2
 PYTHON_ISODATE_SOURCE = isodate-$(PYTHON_ISODATE_VERSION).tar.gz
-PYTHON_ISODATE_SITE = https://files.pythonhosted.org/packages/source/i/isodate
+PYTHON_ISODATE_SITE = $(call pypi,isodate)
 PYTHON_ISODATE_SETUP_TYPE = setuptools
 PYTHON_ISODATE_LICENSE = BSD-3-Clause
 PYTHON_ISODATE_LICENSE_FILES = LICENSE
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
index 485dcc9231..33b98ffe4d 100644
--- a/package/python-iterable-io/python-iterable-io.mk
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ITERABLE_IO_VERSION = 1.0.1
 PYTHON_ITERABLE_IO_SOURCE = iterable_io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
-PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/9e/ad/cc53869e3357520033e3ab9a7d6043045bcdd666da427583678efdbb446e
+PYTHON_ITERABLE_IO_SITE = $(call pypi,iterable_io)
 PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
 PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
 PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 5fb2919c97..7e504d355d 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ITSDANGEROUS_VERSION = 2.2.0
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d
+PYTHON_ITSDANGEROUS_SITE = $(call pypi,itsdangerous)
 PYTHON_ITSDANGEROUS_SETUP_TYPE = flit
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
 PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.txt docs/license.rst
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
index 7a4fee7fc9..8e473b811a 100644
--- a/package/python-iwlib/python-iwlib.mk
+++ b/package/python-iwlib/python-iwlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IWLIB_VERSION = 1.7.0
 PYTHON_IWLIB_SOURCE = iwlib-$(PYTHON_IWLIB_VERSION).tar.gz
-PYTHON_IWLIB_SITE = https://files.pythonhosted.org/packages/59/44/fd72c0a7094baeb448dc9e87b3d579da98e2b8593c3fe05c5f9dd20dc6bc
+PYTHON_IWLIB_SITE = $(call pypi,iwlib)
 PYTHON_IWLIB_LICENSE = GPL-2.0
 PYTHON_IWLIB_LICENSE_FILES = COPYING
 PYTHON_IWLIB_SETUP_TYPE = setuptools
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index 12ec7d6c48..18f7bf6cfd 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JANUS_VERSION = 2.0.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/d8/7f/69884b6618be4baf6ebcacc716ee8680a842428a19f403db6d1c0bb990aa
+PYTHON_JANUS_SITE = $(call pypi,janus)
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 0ba39721bb..456a104f59 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JARACO_CLASSES_VERSION = 3.4.0
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/06/c0/ed4a27bc5571b99e3cff68f8a9fa5b56ff7df1c2251cc715a652ddd26402
+PYTHON_JARACO_CLASSES_SITE = $(call pypi,jaraco.classes)
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
index fe6dcea074..3bf831cd7d 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.mk
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JARACO_COLLECTIONS_VERSION = 5.2.1
 PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco_collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
-PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/fa/d2/751000cf702676dbb78f97728f4d52b029e817e2b3c94088dfe5c70ff46d
+PYTHON_JARACO_COLLECTIONS_SITE = $(call pypi,jaraco_collections)
 PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
 PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
 PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index 27cfd7467c..d81312e2fb 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JARACO_CONTEXT_VERSION = 6.0.2
 PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/8d/7d/41acf8e22d791bde812cb6c2c36128bb932ed8ae066bcb5e39cb198e8253
+PYTHON_JARACO_CONTEXT_SITE = $(call pypi,jaraco_context)
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 397d5122bf..220a9e03c8 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JARACO_FUNCTOOLS_VERSION = 4.4.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084
+PYTHON_JARACO_FUNCTOOLS_SITE = $(call pypi,jaraco_functools)
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 2d612196a6..e07b7b82dd 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JARACO_TEXT_VERSION = 4.0.0
 PYTHON_JARACO_TEXT_SOURCE = jaraco_text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
-PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/4f/00/1b4dbbc5c6dcb87a4278cc229b2b560484bf231bba7922686c5139e5f934
+PYTHON_JARACO_TEXT_SITE = $(call pypi,jaraco_text)
 PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 0404275277..8f32803d61 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JC_VERSION = 1.25.6
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/7c/fa/f174bfb1ecfd3bdc6259b2de32052f09cccba11c9a1b733aedf618fadd05
+PYTHON_JC_SITE = $(call pypi,jc)
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 7cd69f9053..5f390f9698 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JEDI_VERSION = 0.19.2
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a
+PYTHON_JEDI_SITE = $(call pypi,jedi)
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
index f61e54b871..8590f76af3 100644
--- a/package/python-jeepney/python-jeepney.mk
+++ b/package/python-jeepney/python-jeepney.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JEEPNEY_VERSION = 0.9.0
 PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
-PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/7b/6f/357efd7602486741aa73ffc0617fb310a29b588ed0fd69c2399acbb85b0c
+PYTHON_JEEPNEY_SITE = $(call pypi,jeepney)
 PYTHON_JEEPNEY_SETUP_TYPE = flit
 PYTHON_JEEPNEY_LICENSE = MIT
 PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index a52fa77275..79c87b4600 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JINJA2_VERSION = 3.1.6
 PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b
+PYTHON_JINJA2_SITE = $(call pypi,jinja2)
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index b717e2e3ed..5d16b8ae35 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JMESPATH_VERSION = 1.1.0
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/d3/59/322338183ecda247fb5d1763a6cbe46eff7222eaeebafd9fa65d4bf5cb11
+PYTHON_JMESPATH_SITE = $(call pypi,jmespath)
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
 PYTHON_JMESPATH_LICENSE_FILES = LICENSE
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index 017d5a3ec5..6eebcd3b3e 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
-PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://files.pythonhosted.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = $(call pypi,json-schema-validator)
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index faf40cfcde..b6b1215f3f 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSONMODELS_VERSION = 2.8.0
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/04/85/0e02cbc656ef7f0f5d3db13be5b622c231bf55bbad6a8c4612ce95fcb8cf
+PYTHON_JSONMODELS_SITE = $(call pypi,jsonmodels)
 PYTHON_JSONMODELS_SETUP_TYPE = hatch
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index eaeb06c3d8..6124f69c7a 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2025.9.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = $(call pypi,jsonschema_specifications)
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 4f245f2431..27b8c14f06 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSONSCHEMA_VERSION = 4.26.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047
+PYTHON_JSONSCHEMA_SITE = $(call pypi,jsonschema)
 PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index df397bea57..bf83252e42 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KEYRING_VERSION = 25.7.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/43/4b/674af6ef2f97d56f0ab5153bf0bfa28ccb6c3ed4d1babf4305449668807b
+PYTHON_KEYRING_SITE = $(call pypi,keyring)
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
index efc0f52eba..bf6a95509d 100644
--- a/package/python-kflash/python-kflash.mk
+++ b/package/python-kflash/python-kflash.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KFLASH_VERSION = 1.1.6
 PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
-PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/4f/80/d2eaa114bf4434b18fcf8960a907ffce12c9400b08c05902b36007d545b7
+PYTHON_KFLASH_SITE = $(call pypi,kflash)
 PYTHON_KFLASH_SETUP_TYPE = setuptools
 PYTHON_KFLASH_LICENSE = MIT
 PYTHON_KFLASH_LICENSE_FILES = LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2b81c60688..d98f88e9b2 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -6,7 +6,7 @@
 
 PYTHON_KIWISOLVER_VERSION = 1.4.9
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5c/3c/85844f1b0feb11ee581ac23fe5fce65cd049a200c1446708cc1b7f922875
+PYTHON_KIWISOLVER_SITE = $(call pypi,kiwisolver)
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index a52fe73fed..f3667a4fe5 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LARK_VERSION = 1.3.1
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/da/34/28fff3ab31ccff1fd4f6c7c7b0ceb2b6968d8ea4950663eadcb5720591a0
+PYTHON_LARK_SITE = $(call pypi,lark)
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index cd87024111..04dd85d093 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LEGACY_CGI_VERSION = 2.6.4
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
-PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/f4/9c/91c7d2c5ebbdf0a1a510bfa0ddeaa2fbb5b78677df5ac0a0aa51cf7125b0
+PYTHON_LEGACY_CGI_SITE = $(call pypi,legacy_cgi)
 PYTHON_LEGACY_CGI_SETUP_TYPE = hatch
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
index 5bea1b2cc6..74d374f180 100644
--- a/package/python-libconf/python-libconf.mk
+++ b/package/python-libconf/python-libconf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LIBCONF_VERSION = 2.0.1
 PYTHON_LIBCONF_SOURCE = libconf-$(PYTHON_LIBCONF_VERSION).tar.gz
-PYTHON_LIBCONF_SITE = https://files.pythonhosted.org/packages/c8/41/592c24b42ec6e349629f2b6310ff31255b213bc696c0e4ad2ee1d2bbb68e
+PYTHON_LIBCONF_SITE = $(call pypi,libconf)
 PYTHON_LIBCONF_SETUP_TYPE = setuptools
 PYTHON_LIBCONF_LICENSE = MIT
 PYTHON_LIBCONF_LICENSE_FILES = LICENSE
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
index 1d2fc74708..bea712570f 100644
--- a/package/python-libevdev/python-libevdev.mk
+++ b/package/python-libevdev/python-libevdev.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LIBEVDEV_VERSION = 0.13.1
 PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
-PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/86/ff/4f8ab38330965168be742b772bcd151a7a052ea17b2481c43a607875d4ed
+PYTHON_LIBEVDEV_SITE = $(call pypi,libevdev)
 PYTHON_LIBEVDEV_SETUP_TYPE = hatch
 PYTHON_LIBEVDEV_LICENSE = MIT
 PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 264fe83281..80e6b75160 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LIBRT_VERSION = 0.9.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
+PYTHON_LIBRT_SITE = $(call pypi,librt)
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 10a727a7a9..c836e55d6f 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LIBUSB1_VERSION = 3.3.1
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a2/7f/c59ad56d1bca8fa4321d1bb77ba4687775751a4deceec14943a44da18ca0
+PYTHON_LIBUSB1_SITE = $(call pypi,libusb1)
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index ba3d257fdd..911d812f4b 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LMDB_VERSION = 2.2.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/21/44/d94934efaf8f887b6959f131fde740fcaa831edfd13eb5425574637cddd5
+PYTHON_LMDB_SITE = $(call pypi,lmdb)
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
diff --git a/package/python-lockfile/python-lockfile.mk b/package/python-lockfile/python-lockfile.mk
index 212edcdcae..5469418c5e 100644
--- a/package/python-lockfile/python-lockfile.mk
+++ b/package/python-lockfile/python-lockfile.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LOCKFILE_VERSION = 0.12.2
 PYTHON_LOCKFILE_SOURCE = lockfile-$(PYTHON_LOCKFILE_VERSION).tar.gz
-PYTHON_LOCKFILE_SITE = https://files.pythonhosted.org/packages/17/47/72cb04a58a35ec495f96984dddb48232b551aafb95bde614605b754fe6f7
+PYTHON_LOCKFILE_SITE = $(call pypi,lockfile)
 PYTHON_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_LOCKFILE_LICENSE = MIT
 PYTHON_LOCKFILE_LICENSE_FILES = LICENSE
diff --git a/package/python-log-rate-limit/python-log-rate-limit.mk b/package/python-log-rate-limit/python-log-rate-limit.mk
index 8b2d423de0..67190e8d88 100644
--- a/package/python-log-rate-limit/python-log-rate-limit.mk
+++ b/package/python-log-rate-limit/python-log-rate-limit.mk
@@ -6,7 +6,7 @@
 
 PYTHON_LOG_RATE_LIMIT_VERSION = 1.4.2
 PYTHON_LOG_RATE_LIMIT_SOURCE = log_rate_limit-$(PYTHON_LOG_RATE_LIMIT_VERSION).tar.gz
-PYTHON_LOG_RATE_LIMIT_SITE = https://files.pythonhosted.org/packages/0d/c2/d3c67f59b934d0edfc00a7cfcac56d17fa9b9832ba8e353217c93187e506
+PYTHON_LOG_RATE_LIMIT_SITE = $(call pypi,log_rate_limit)
 PYTHON_LOG_RATE_LIMIT_SETUP_TYPE = poetry
 PYTHON_LOG_RATE_LIMIT_LICENSE = Apache-2.0
 PYTHON_LOG_RATE_LIMIT_LICENSE_FILES = LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 2bcd48bc2f..b66ea8e29f 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -7,7 +7,7 @@
 PYTHON_LOGBOOK_VERSION = 1.9.2
 PYTHON_LOGBOOK_SOURCE_PYPI = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
 PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/f2/cf/e39c249003caaa7f84e2b00c11c7423892d525f8136ff349f9914914a744
-PYTHON_LOGBOOK_SITE = $(PYTHON_LOGBOOK_SITE_PYPI)/$(PYTHON_LOGBOOK_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_LOGBOOK_SITE = $(call pypi,python-logbook)
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools-rust
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
diff --git a/package/python-logstash/python-logstash.mk b/package/python-logstash/python-logstash.mk
index 6cdbe2009b..9abedd78ad 100644
--- a/package/python-logstash/python-logstash.mk
+++ b/package/python-logstash/python-logstash.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_LOGSTASH_VERSION = 0.4.8
-PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/f7/3b/c3a957bbdd23859f07905fc3d1adfe89957217a347478c58409f0315cf1d
+PYTHON_LOGSTASH_SITE = $(call pypi,python-logstash)
 PYTHON_LOGSTASH_SETUP_TYPE = setuptools
 PYTHON_LOGSTASH_LICENSE = MIT
 PYTHON_LOGSTASH_LICENSE_FILES = LICENSE
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index d12f65dd8c..be1e06afe2 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_LXML_VERSION = 6.0.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb
+PYTHON_LXML_SITE = $(call pypi,python-lxml)
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 616d72dfbf..6720adee04 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.6.0
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic_wormhole_mailbox_server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_mailbox_server
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = $(call pypi,magic_wormhole_mailbox_server)
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
index 4f83c6fc51..31731c71e4 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.5.0
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic_wormhole_transit_relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_transit_relay
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = $(call pypi,magic_wormhole_transit_relay)
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 9f3b4dfe1c..f975dba06c 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
+PYTHON_MAGIC_WORMHOLE_SITE = $(call pypi,magic_wormhole)
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 0f52fa2185..f58e2a6c1d 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MAKO_VERSION = 1.3.12
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/00/62/791b31e69ae182791ec67f04850f2f062716bbd205483d63a215f3e062d3
+PYTHON_MAKO_SITE = $(call pypi,mako)
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index 0b2666cc03..e5f8af282a 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
 PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
-PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
+PYTHON_MARKDOWN_IT_PY_SITE = $(call pypi,markdown_it_py)
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 0abcae709e..6724aa2f4e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARKDOWN_VERSION = 3.10.2
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/2b/f4/69fa6ed85ae003c2378ffa8f6d2e3234662abd02c10d216c0ba96081a238
+PYTHON_MARKDOWN_SITE = $(call pypi,markdown)
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 1de824e57f..ee8bb31196 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARKDOWN2_VERSION = 2.5.5
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/e4/ae/07d4a5fcaa5509221287d289323d75ac8eda5a5a4ac9de2accf7bbcc2b88
+PYTHON_MARKDOWN2_SITE = $(call pypi,markdown2)
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 7732b9a7e1..3f42892317 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARKUPSAFE_VERSION = 3.0.3
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7
+PYTHON_MARKUPSAFE_SITE = $(call pypi,markupsafe)
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 15715d9006..bc469efd02 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.5.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/ee/fe/247c297809e64116f766716632adbc3f4cd06f376f56dc15bb92f170d247
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = $(call pypi,marshmallow_sqlalchemy)
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 964ff66732..576862867b 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MARSHMALLOW_VERSION = 4.3.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/25/7e/1dbd4096eb7c148cd2841841916f78820bb85a4d80a0c25c02d30815a7fb
+PYTHON_MARSHMALLOW_SITE = $(call pypi,marshmallow)
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index 54c4a18661..7de80d1dc4 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.1
 PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1
+PYTHON_MATPLOTLIB_INLINE_SITE = $(call pypi,matplotlib_inline)
 PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = flit
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 067bd68685..54b0df5444 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MATPLOTLIB_VERSION = 3.10.9
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/63/1b/4be5be87d43d327a0cf4de1a56e86f7f84c89312452406cf122efe2839e6
+PYTHON_MATPLOTLIB_SITE = $(call pypi,matplotlib)
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index dba5e8bbce..51d196230a 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -7,7 +7,7 @@
 PYTHON_MATURIN_VERSION = 1.11.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
 PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
-PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_MATURIN_SITE = $(call pypi,python-maturin)
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 6f51b36103..c5595333ef 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MBSTRDECODER_VERSION = 1.1.4
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/31/ab/05ae008357c8bdb6245ebf8a101d99f26c096e0ea20800b318153da23796
+PYTHON_MBSTRDECODER_SITE = $(call pypi,mbstrdecoder)
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
index dcbec98089..88936c51f7 100644
--- a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
 PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
-PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
+PYTHON_MDIT_PY_PLUGINS_SITE = $(call pypi,mdit_py_plugins)
 PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
 PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
 PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
diff --git a/package/python-mdurl/python-mdurl.mk b/package/python-mdurl/python-mdurl.mk
index c6ed397438..71d05ade01 100644
--- a/package/python-mdurl/python-mdurl.mk
+++ b/package/python-mdurl/python-mdurl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MDURL_VERSION = 0.1.2
 PYTHON_MDURL_SOURCE = mdurl-$(PYTHON_MDURL_VERSION).tar.gz
-PYTHON_MDURL_SITE = https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90
+PYTHON_MDURL_SITE = $(call pypi,mdurl)
 PYTHON_MDURL_SETUP_TYPE = flit
 PYTHON_MDURL_LICENSE = MIT
 PYTHON_MDURL_LICENSE_FILES = LICENSE
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
index c7f84043eb..bce809b471 100644
--- a/package/python-memory-profiler/python-memory-profiler.mk
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MEMORY_PROFILER_VERSION = 0.61.0
 PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
-PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/b2/88/e1907e1ca3488f2d9507ca8b0ae1add7b1cd5d3ca2bc8e5b329382ea2c7b
+PYTHON_MEMORY_PROFILER_SITE = $(call pypi,memory_profiler)
 PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
 PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
 PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
diff --git a/package/python-memray/python-memray.mk b/package/python-memray/python-memray.mk
index 85e16a4c95..26fbf5b4c9 100644
--- a/package/python-memray/python-memray.mk
+++ b/package/python-memray/python-memray.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MEMRAY_VERSION = 1.19.1
 PYTHON_MEMRAY_SOURCE = memray-$(PYTHON_MEMRAY_VERSION).tar.gz
-PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/36/18/5df5995a7b142e12ab194f4b2fd1473efd51f4f622dfe47f3c013c3c11f7
+PYTHON_MEMRAY_SITE = $(call pypi,memray)
 PYTHON_MEMRAY_SETUP_TYPE = setuptools
 PYTHON_MEMRAY_LICENSE = Apache-2.0
 PYTHON_MEMRAY_LICENSE_FILES = LICENSE src/vendor/libbacktrace/LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index af8f26f9a8..3f59c30611 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MESON_PYTHON_VERSION = 0.19.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/32/98/7fe5d1bf741c03c6eea04b6245737dbd79657d4f9200e82fcbb4cc12637b
+PYTHON_MESON_PYTHON_SITE = $(call pypi,meson_python)
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
diff --git a/package/python-midiutil/python-midiutil.mk b/package/python-midiutil/python-midiutil.mk
index cb7e8f6ccb..b225a46641 100644
--- a/package/python-midiutil/python-midiutil.mk
+++ b/package/python-midiutil/python-midiutil.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MIDIUTIL_VERSION = 1.2.1
 PYTHON_MIDIUTIL_SOURCE = MIDIUtil-$(PYTHON_MIDIUTIL_VERSION).tar.gz
-PYTHON_MIDIUTIL_SITE = https://files.pythonhosted.org/packages/f5/44/fde6772d8bfaea64fcf5eb948124d0a5fdf5f848b14ac22a23ced53e562d
+PYTHON_MIDIUTIL_SITE = $(call pypi,MIDIUtil)
 PYTHON_MIDIUTIL_SETUP_TYPE = setuptools
 PYTHON_MIDIUTIL_LICENSE = MIT
 PYTHON_MIDIUTIL_LICENSE_FILES = License.txt
diff --git a/package/python-mimeparse/python-mimeparse.mk b/package/python-mimeparse/python-mimeparse.mk
index a67d02f818..8cfc13817d 100644
--- a/package/python-mimeparse/python-mimeparse.mk
+++ b/package/python-mimeparse/python-mimeparse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MIMEPARSE_VERSION = 2.0.0
 PYTHON_MIMEPARSE_SOURCE = python_mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
-PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/cd/85/c40f2e0b2128905f6c34894be01803c114f2b2efab0e8b4c3dca5e56b999
+PYTHON_MIMEPARSE_SITE = $(call pypi,python_mimeparse)
 PYTHON_MIMEPARSE_SETUP_TYPE = setuptools
 PYTHON_MIMEPARSE_LICENSE = MIT
 PYTHON_MIMEPARSE_LICENSE_FILES = LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
index cb8a0d8cc9..dfc5f7f70f 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.mk
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MINIMALMODBUS_VERSION = 2.1.1
 PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
-PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
+PYTHON_MINIMALMODBUS_SITE = $(call pypi,minimalmodbus)
 PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
 PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
 PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index b67700b1a7..adfb69df9f 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MISTUNE_VERSION = 3.2.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/9d/55/d01f0c4b45ade6536c51170b9043db8b2ec6ddf4a35c7ea3f5f559ac935b
+PYTHON_MISTUNE_SITE = $(call pypi,mistune)
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index e83131c993..fe4a2e6c25 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ML_DTYPES_VERSION = 0.5.4
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/0e/4a/c27b42ed9b1c7d13d9ba8b6905dece787d6259152f2309338aed29b2447b
+PYTHON_ML_DTYPES_SITE = $(call pypi,ml_dtypes)
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 8edf824f66..d4c94c9629 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MODBUS_TK_VERSION = 1.1.5
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/53/28/bdfb29ce9bec76015bf3d3ad6103324a0575843ee4b20663c53cc389c227
+PYTHON_MODBUS_TK_SITE = $(call pypi,modbus_tk)
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 9fd9da10e4..4b28b970e6 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MORE_ITERTOOLS_VERSION = 11.0.2
 PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a2/f7/139d22fef48ac78127d18e01d80cf1be40236ae489769d17f35c3d425293
+PYTHON_MORE_ITERTOOLS_SITE = $(call pypi,more_itertools)
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index 2d2784e89d..20bb926d71 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_MPD2_VERSION = 3.1.1
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/53/be/e77206eb35eb37ccd3506fba237e1431431d04c482707730ce2a6802e95c
+PYTHON_MPD2_SITE = $(call pypi,python-mpd2)
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index 86a3562d04..21eb401bfb 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MPMATH_VERSION = 1.3.0
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
+PYTHON_MPMATH_SITE = $(call pypi,mpmath)
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index 8565c2210e..9f9ed8ed37 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MSGFY_VERSION = 0.2.1
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/51/0e/b78151a63e8c5cab745e90ed7b4a741dba5439a8538636bf6a5da72bad23
+PYTHON_MSGFY_SITE = $(call pypi,msgfy)
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 76606268ae..efcac8e7b4 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MSGPACK_VERSION = 1.1.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f
+PYTHON_MSGPACK_SITE = $(call pypi,msgpack)
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index dc92b653a1..e7d464abc7 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MULTIDICT_VERSION = 6.7.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1a/c2/c2d94cbe6ac1753f3fc980da97b3d930efe1da3af3c9f5125354436c073d
+PYTHON_MULTIDICT_SITE = $(call pypi,multidict)
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index cdaae6ef67..7836e80819 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MULTIPART_VERSION = 0.0.22
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
+PYTHON_MULTIPART_SITE = $(call pypi,python_multipart)
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
index c2941aa0b5..4666422b97 100644
--- a/package/python-munch/python-munch.mk
+++ b/package/python-munch/python-munch.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MUNCH_VERSION = 4.0.0
 PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
-PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/e7/2b/45098135b5f9f13221820d90f9e0516e11a2a0f55012c13b081d202b782a
+PYTHON_MUNCH_SITE = $(call pypi,munch)
 PYTHON_MUNCH_SETUP_TYPE = setuptools
 PYTHON_MUNCH_LICENSE = MIT
 PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index d42ed27e49..2b658c310a 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MUTAGEN_VERSION = 1.47.0
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77
+PYTHON_MUTAGEN_SITE = $(call pypi,mutagen)
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = setuptools
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 60154f6eeb..b97f297acd 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MWCLIENT_VERSION = 0.11.0
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/5e/b3/0f77b8838a22e99b9cb64aef15fb96a4a8315fe890dbe3bff6f8364e8940
+PYTHON_MWCLIENT_SITE = $(call pypi,mwclient)
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = LICENSE.md
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index cf0f7c681c..32401d1f46 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MYPY_EXTENSIONS_VERSION = 1.1.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/a2/6e/371856a3fb9d31ca8dac321cda606860fa4548858c0cc45d9d1d4ca2628b
+PYTHON_MYPY_EXTENSIONS_SITE = $(call pypi,mypy_extensions)
 PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 4b02753978..a119fec2d8 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MYPY_VERSION = 1.19.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
+PYTHON_MYPY_SITE = $(call pypi,mypy)
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
diff --git a/package/python-nested-dict/python-nested-dict.mk b/package/python-nested-dict/python-nested-dict.mk
index 1a5b180e10..c7f276f3cb 100644
--- a/package/python-nested-dict/python-nested-dict.mk
+++ b/package/python-nested-dict/python-nested-dict.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NESTED_DICT_VERSION = 1.61
 PYTHON_NESTED_DICT_SOURCE = nested_dict-$(PYTHON_NESTED_DICT_VERSION).tar.gz
-PYTHON_NESTED_DICT_SITE = https://files.pythonhosted.org/packages/42/d0/3b27fa65b16a2e44d793af59929fcdb3bb84b4664462ff2830105dfd9b7d
+PYTHON_NESTED_DICT_SITE = $(call pypi,nested_dict)
 PYTHON_NESTED_DICT_SETUP_TYPE = setuptools
 PYTHON_NESTED_DICT_LICENSE = MIT
 PYTHON_NESTED_DICT_LICENSE_FILES = LICENSE.TXT
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 7c26b16bb4..34e9753885 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NETADDR_VERSION = 1.3.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d
+PYTHON_NETADDR_SITE = $(call pypi,netaddr)
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE.rst
 PYTHON_NETADDR_SETUP_TYPE = setuptools
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 1b1aa99568..13c99a9acb 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NETIFACES_VERSION = 0.11.0
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/a6/91/86a6eac449ddfae239e93ffc1918cf33fd9bab35c04d1e963b311e347a73
+PYTHON_NETIFACES_SITE = $(call pypi,netifaces)
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = LICENSE
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 785d2c0d3e..2b186343f5 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_NETWORKMANAGER_VERSION = 2.2
-PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/f2/3d/0924d03117636b80a88af783f857fb101e4c47953a8bb0f733b964d50af4
+PYTHON_NETWORKMANAGER_SITE = $(call pypi,python-networkmanager)
 PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_NETWORKMANAGER_LICENSE = Zlib
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index d2495590be..0e73e4383c 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NETWORKX_VERSION = 3.6.1
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512
+PYTHON_NETWORKX_SITE = $(call pypi,networkx)
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 6b052569fe..ecc027caa6 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NUMPY_VERSION = 2.4.0
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
-PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/a4/7a/6a3d14e205d292b738db449d0de649b373a59edb0d0b4493821d0a3e8718
+PYTHON_NUMPY_SITE = $(call pypi,numpy)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
 PYTHON_NUMPY_LICENSE_FILES = \
 	LICENSE.txt \
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index bbf59acedb..224d5cd024 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_OAUTHLIB_VERSION = 3.3.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
+PYTHON_OAUTHLIB_SITE = $(call pypi,oauthlib)
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index e7da7482fb..2c09ea4b1e 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_OPCUA_ASYNCIO_VERSION = 1.1.5
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/49/be/be6dad2b7db58fc9e92260fa9fdda8604841f2863d60ec2c49dccb1f9661
+PYTHON_OPCUA_ASYNCIO_SITE = $(call pypi,asyncua)
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 9b5016c9e4..c115ed70e5 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -7,7 +7,7 @@
 PYTHON_ORJSON_VERSION = 3.11.5
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
 PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/04/b8/333fdb27840f3bf04022d21b654a35f58e15407183aeb16f3b41aa053446
-PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_ORJSON_SITE = $(call pypi,python-orjson)
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
index aa8a6cbf38..b0edd09448 100644
--- a/package/python-outcome/python-outcome.mk
+++ b/package/python-outcome/python-outcome.mk
@@ -6,7 +6,7 @@
 
 PYTHON_OUTCOME_VERSION = 1.3.0.post0
 PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
-PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/98/df/77698abfac98571e65ffeb0c1fba8ffd692ab8458d617a0eed7d9a8d38f2
+PYTHON_OUTCOME_SITE = $(call pypi,outcome)
 PYTHON_OUTCOME_SETUP_TYPE = setuptools
 PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
 PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 41f8fef6a2..7501fc4f72 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PACKAGING_VERSION = 26.2
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270
+PYTHON_PACKAGING_SITE = $(call pypi,packaging)
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6ad0fa0d1b..69c91815c3 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PARAMIKO_VERSION = 4.0.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4
+PYTHON_PARAMIKO_SITE = $(call pypi,paramiko)
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 9457fcde6d..6580dac728 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PARSO_VERSION = 0.8.6
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/81/76/a1e769043c0c0c9fe391b702539d594731a4362334cdf4dc25d0c09761e7
+PYTHON_PARSO_SITE = $(call pypi,parso)
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
index 013fec74de..bad1bbba8d 100644
--- a/package/python-passlib/python-passlib.mk
+++ b/package/python-passlib/python-passlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PASSLIB_VERSION = 1.7.4
 PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
-PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/b6/06/9da9ee59a67fae7761aab3ccc84fa4f3f33f125b370f1ccdb915bf967c11
+PYTHON_PASSLIB_SITE = $(call pypi,passlib)
 PYTHON_PASSLIB_SETUP_TYPE = setuptools
 PYTHON_PASSLIB_LICENSE = BSD-3-Clause
 PYTHON_PASSLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-patch-ng/python-patch-ng.mk b/package/python-patch-ng/python-patch-ng.mk
index b5f285d106..940a781c89 100644
--- a/package/python-patch-ng/python-patch-ng.mk
+++ b/package/python-patch-ng/python-patch-ng.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PATCH_NG_VERSION = 1.19.1
 PYTHON_PATCH_NG_SOURCE = patch_ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
-PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/da/b6/8ea8095f964f93567bbe28709298b30104ad418b50d4217538387bf48f7d
+PYTHON_PATCH_NG_SITE = $(call pypi,patch_ng)
 PYTHON_PATCH_NG_SETUP_TYPE = setuptools
 PYTHON_PATCH_NG_LICENSE = MIT
 PYTHON_PATCH_NG_LICENSE_FILES = LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
index 8d287772d0..0f78b5415f 100644
--- a/package/python-path/python-path.mk
+++ b/package/python-path/python-path.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PATH_VERSION = 17.1.1
 PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
-PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/dd/52/a7bdd5ef8488977d354b7915d1e75009bebbd04f73eff14e52372d5e9435
+PYTHON_PATH_SITE = $(call pypi,path)
 PYTHON_PATH_SETUP_TYPE = setuptools
 PYTHON_PATH_LICENSE = MIT
 PYTHON_PATH_LICENSE_FILES = LICENSE
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 2fd6e931f8..b7505468c6 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PATHPY_VERSION = 12.5.0
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/b6/e3/81be70016d58ade0f516191fa80152daba5453d0b07ce648d9daae86a188
+PYTHON_PATHPY_SITE = $(call pypi,path.py)
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
 PYTHON_PATHPY_LICENSE_FILES = LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index f418108ad9..d05d5cfa5f 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PATHSPEC_VERSION = 1.1.1
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/5a/82/42f767fc1c1143d6fd36efb827202a2d997a375e160a71eb2888a925aac1
+PYTHON_PATHSPEC_SITE = $(call pypi,pathspec)
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = flit
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 5d5baa5731..5994d14b14 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PATHVALIDATE_VERSION = 3.3.1
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/fa/2a/52a8da6fe965dea6192eb716b357558e103aea0a1e9a8352ad575a8406ca
+PYTHON_PATHVALIDATE_SITE = $(call pypi,pathvalidate)
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 9b3d34c4e8..36869dd59a 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PBR_VERSION = 7.0.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
+PYTHON_PBR_SITE = $(call pypi,pbr)
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index b02154128c..3a1bb8f115 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PDM_BACKEND_VERSION = 2.4.8
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/7c/7e/6d441c8739a30820ec59517a88326789c201ae43a344b2ffb02fb2702d8e
+PYTHON_PDM_BACKEND_SITE = $(call pypi,pdm_backend)
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
index e04db7a116..db00969c0a 100644
--- a/package/python-pefile/python-pefile.mk
+++ b/package/python-pefile/python-pefile.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PEFILE_VERSION = 2024.8.26
 PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
-PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/03/4f/2750f7f6f025a1507cd3b7218691671eecfd0bbebebe8b39aa0fe1d360b8
+PYTHON_PEFILE_SITE = $(call pypi,pefile)
 PYTHON_PEFILE_SETUP_TYPE = setuptools
 PYTHON_PEFILE_LICENSE = MIT
 PYTHON_PEFILE_LICENSE_FILES = LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 7a49f305a5..18bc3d64cc 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_PERIPHERY_VERSION = 2.4.1
-PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/df/f1/1a986ad2bb696033168db2121151e5ff90df033af780ffca47c8bb559f29
+PYTHON_PERIPHERY_SITE = $(call pypi,python-periphery)
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
 PYTHON_PERIPHERY_SETUP_TYPE = setuptools
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index 469144aa60..b036d4cc04 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PEXPECT_VERSION = 4.9.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/42/92/cc564bf6381ff43ce1f4d06852fc19a2f11d180f23dc32d9588bee2f149d
+PYTHON_PEXPECT_SITE = $(call pypi,pexpect)
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = setuptools
diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
index 1ed1257d03..aa7062aa1d 100644
--- a/package/python-pickleshare/python-pickleshare.mk
+++ b/package/python-pickleshare/python-pickleshare.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PICKLESHARE_VERSION = 0.7.5
 PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
-PYTHON_PICKLESHARE_SITE = https://files.pythonhosted.org/packages/d8/b6/df3c1c9b616e9c0edbc4fbab6ddd09df9535849c64ba51fcb6531c32d4d8
+PYTHON_PICKLESHARE_SITE = $(call pypi,pickleshare)
 PYTHON_PICKLESHARE_LICENSE = MIT
 PYTHON_PICKLESHARE_LICENSE_FILES = LICENSE
 PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
diff --git a/package/python-pigpio/python-pigpio.mk b/package/python-pigpio/python-pigpio.mk
index 73e326cba1..a2f4482976 100644
--- a/package/python-pigpio/python-pigpio.mk
+++ b/package/python-pigpio/python-pigpio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PIGPIO_VERSION = 1.78
 PYTHON_PIGPIO_SOURCE = pigpio-$(PYTHON_PIGPIO_VERSION).tar.gz
-PYTHON_PIGPIO_SITE = https://files.pythonhosted.org/packages/a9/4a/3ebdfd90906553fb5420e80a475eb52f0809f2a29b547ba3b260db0cbc8f
+PYTHON_PIGPIO_SITE = $(call pypi,pigpio)
 PYTHON_PIGPIO_SETUP_TYPE = setuptools
 PYTHON_PIGPIO_LICENSE = Unlicense
 
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 19e3f8e279..c4de5e5b83 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_PILLOW_VERSION = 12.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
+PYTHON_PILLOW_SITE = $(call pypi,python-pillow)
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..5566f08f63 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PIP_VERSION = 26.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
+PYTHON_PIP_SITE = $(call pypi,pip)
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
index 4fbf22ab65..cc5774cb65 100644
--- a/package/python-pkgconfig/python-pkgconfig.mk
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PKGCONFIG_VERSION = 1.6.0
 PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
-PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/52/fd/0adde075cd3bfecd557bc7d757e00e231d34d8a6edb4c8d1642759254c21
+PYTHON_PKGCONFIG_SITE = $(call pypi,pkgconfig)
 PYTHON_PKGCONFIG_SETUP_TYPE = poetry
 PYTHON_PKGCONFIG_LICENSE = MIT
 PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index c3a7df9037..c16d7f645b 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PLATFORMDIRS_VERSION = 4.9.6
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
+PYTHON_PLATFORMDIRS_SITE = $(call pypi,platformdirs)
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index a5d8f5e94b..7a32eada98 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PLUGGY_VERSION = 1.6.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779
+PYTHON_PLUGGY_SITE = $(call pypi,pluggy)
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 5dc7964d5f..e009ffac0b 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PLY_VERSION = 3.11
 PYTHON_PLY_SOURCE = ply-$(PYTHON_PLY_VERSION).tar.gz
-PYTHON_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
+PYTHON_PLY_SITE = $(call pypi,ply)
 PYTHON_PLY_SETUP_TYPE = setuptools
 PYTHON_PLY_LICENSE = BSD-3-Clause
 PYTHON_PLY_LICENSE_FILES = README.md
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index a8db44e24d..c8deadff62 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -6,7 +6,7 @@
 
 PYTHON_POETRY_CORE_VERSION = 2.3.2
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/10/48/5b4f344c252ee2f75051b6bf7dfb68ab53aa00a107f5f8e5cbf795701dad
+PYTHON_POETRY_CORE_SITE = $(call pypi,poetry_core)
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 4e9e50c338..bba7565439 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PORTEND_VERSION = 3.2.1
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/b7/57/be90f42996fc4f57d5742ef2c95f7f7bb8e9183af2cc11bff8e7df338888
+PYTHON_PORTEND_SITE = $(call pypi,portend)
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 46bbc7754a..05b5887222 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_POSIX_IPC_VERSION = 1.3.2
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/40/59/56be08bcd98bcb8bd2ec3de7dea4a8da3bde63b17974896ed2b91c9a4fb7
+PYTHON_POSIX_IPC_SITE = $(call pypi,posix_ipc)
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
diff --git a/package/python-priority/python-priority.mk b/package/python-priority/python-priority.mk
index 6e141c3e37..8a64726d55 100644
--- a/package/python-priority/python-priority.mk
+++ b/package/python-priority/python-priority.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PRIORITY_VERSION = 2.0.0
 PYTHON_PRIORITY_SOURCE = priority-$(PYTHON_PRIORITY_VERSION).tar.gz
-PYTHON_PRIORITY_SITE = https://files.pythonhosted.org/packages/f5/3c/eb7c35f4dcede96fca1842dac5f4f5d15511aa4b52f3a961219e68ae9204
+PYTHON_PRIORITY_SITE = $(call pypi,priority)
 PYTHON_PRIORITY_SETUP_TYPE = setuptools
 PYTHON_PRIORITY_LICENSE = MIT
 PYTHON_PRIORITY_LICENSE_FILES = LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 280a6561e2..c54ac08f7d 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.52
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/a1/96/06e01a7b38dce6fe1db213e061a4602dd6032a8a97ef6c1a862537732421
+PYTHON_PROMPT_TOOLKIT_SITE = $(call pypi,prompt_toolkit)
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 88d1f2cfba..fe120d41af 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROPCACHE_VERSION = 0.4.1
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf63743258bff22b3dfa7ea5baef7b5bc324af47a0ad89b8ffc6f
+PYTHON_PROPCACHE_SITE = $(call pypi,propcache)
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 3ae0e2e908..40a1753f0a 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTO_PLUS_VERSION = 1.27.2
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/81/0d/94dfe80193e79d55258345901acd2917523d56e8381bc4dee7fd38e3868a
+PYTHON_PROTO_PLUS_SITE = $(call pypi,proto_plus)
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 3ba1b96514..0f6ba8f2e8 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41
+PYTHON_PROTOBUF_SITE = $(call pypi,protobuf)
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 18b7841fc5..fd5ed38743 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PSUTIL_VERSION = 7.2.2
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/c6/d1ddf4abb55e93cebc4f2ed8b5d6dbad109ecb8d63748dd2b20ab5e57ebe
+PYTHON_PSUTIL_SITE = $(call pypi,psutil)
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 689788c2c0..03d8e0b9c5 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PSYCOPG2_VERSION = 2.9.11
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/8d/9d12bc8677c24dad342ec777529bce705b3e785fa05d85122b5502b9ab55
+PYTHON_PSYCOPG2_SITE = $(call pypi,psycopg2)
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index e68497fbcb..5e11b486f6 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PSYGNAL_VERSION = 0.15.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/4e/79/20c3e23e75272e9ddf018097cf872ab088bccba978888472656629efa4a3
+PYTHON_PSYGNAL_SITE = $(call pypi,psygnal)
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
index 5266019562..e19e83895a 100644
--- a/package/python-ptyprocess/python-ptyprocess.mk
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_PTYPROCESS_VERSION = 0.7.0
-PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/20/e5/16ff212c1e452235a90aeb09066144d0c5a6a8c0834397e03f5224495c4e
+PYTHON_PTYPROCESS_SITE = $(call pypi,python-ptyprocess)
 PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
 PYTHON_PTYPROCESS_LICENSE = ISC
 PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 603ce4cc30..873dd1c51a 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PUDB_VERSION = 2025.1.5
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/f5/69/0c52c6058da586e173e48ef8f9c45bc805d9df78d5ad4d69467ff68694b5
+PYTHON_PUDB_SITE = $(call pypi,pudb)
 PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
index 721640eabd..46788989a0 100644
--- a/package/python-pure-eval/python-pure-eval.mk
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PURE_EVAL_VERSION = 0.2.3
 PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
-PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b
+PYTHON_PURE_EVAL_SITE = $(call pypi,pure_eval)
 PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 PYTHON_PURE_EVAL_LICENSE = MIT
 PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index cec02dcfa9..c360d85b52 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PY_VERSION = 1.11.0
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
-PYTHON_PY_SITE = https://files.pythonhosted.org/packages/98/ff/fec109ceb715d2a6b4c4a85a61af3b40c723a961e8828319fbcb15b868dc
+PYTHON_PY_SITE = $(call pypi,py)
 PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
diff --git a/package/python-pyaes/python-pyaes.mk b/package/python-pyaes/python-pyaes.mk
index 77ec100058..768958d5b4 100644
--- a/package/python-pyaes/python-pyaes.mk
+++ b/package/python-pyaes/python-pyaes.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYAES_VERSION = 1.6.1
 PYTHON_PYAES_SOURCE = pyaes-$(PYTHON_PYAES_VERSION).tar.gz
-PYTHON_PYAES_SITE = https://files.pythonhosted.org/packages/44/66/2c17bae31c906613795711fc78045c285048168919ace2220daa372c7d72
+PYTHON_PYAES_SITE = $(call pypi,pyaes)
 PYTHON_PYAES_SETUP_TYPE = setuptools
 PYTHON_PYAES_LICENSE = MIT
 PYTHON_PYAES_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index a299bd3618..7db2c7681f 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYAML_VERSION = 26.2.1
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/38/fb/2b9590512a9d7763620d87171c7531d5295678ce96e57393614b91da8998
+PYTHON_PYAML_SITE = $(call pypi,pyaml)
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index 4398e1350e..eff939355f 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASN1_MODULES_VERSION = 0.4.2
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1_modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/e9/e6/78ebbb10a8c8e4b61a59249394a4a594c1a7af95593dc933a349c8d00964
+PYTHON_PYASN1_MODULES_SITE = $(call pypi,pyasn1_modules)
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 7278b3f857..bb082dd324 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASN1_VERSION = 0.6.3
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/5c/5f/6583902b6f79b399c9c40674ac384fd9cd77805f9e6205075f828ef11fb2
+PYTHON_PYASN1_SITE = $(call pypi,pyasn1)
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
index 55f8979805..829c2b5c5f 100644
--- a/package/python-pyasynchat/python-pyasynchat.mk
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCHAT_VERSION = 1.0.5
 PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
-PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/ec/d2/b41df9021c12ca314146abcde7bdd3d9d37d44cc01559d7f13df459ee586
+PYTHON_PYASYNCHAT_SITE = $(call pypi,pyasynchat)
 PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
 PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
 PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index a6d0fce13e..e2d69b44f7 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCORE_VERSION = 1.0.5
 PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
-PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/4e/43/035dfe0cb01687c1940fdc008f46a43c41067e226e862df49327469764a0
+PYTHON_PYASYNCORE_SITE = $(call pypi,pyasyncore)
 PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
 PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index fb1d2bac74..f096c8981a 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCAIRO_VERSION = 1.29.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd
+PYTHON_PYCAIRO_SITE = $(call pypi,pycairo)
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index cb645e60f0..8d014de1a2 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCARES_VERSION = 5.0.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/df/a0/9c823651872e6a0face3f0311de2a40c8bbcb9c8dcb15680bd019ac56ac7
+PYTHON_PYCARES_SITE = $(call pypi,pycares)
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 68b7a1f143..3c42486735 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCPARSER_VERSION = 3.0
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6
+PYTHON_PYCPARSER_SITE = $(call pypi,pycparser)
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index ac0e5e1cca..1adcfe7c5c 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCRATE_VERSION = 0.7.11
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/42/70/64a5b11e831dab532b4b61e684c5807a68daeb93b2bd4853975acaaf968e
+PYTHON_PYCRATE_SITE = $(call pypi,pycrate)
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 9b367227c8..f15ac9d299 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCRYPTODOMEX_VERSION = 3.23.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41
+PYTHON_PYCRYPTODOMEX_SITE = $(call pypi,pycryptodomex)
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python-pycups/python-pycups.mk b/package/python-pycups/python-pycups.mk
index 60f4b483f7..2a3e129ae8 100644
--- a/package/python-pycups/python-pycups.mk
+++ b/package/python-pycups/python-pycups.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCUPS_VERSION = 2.0.4
 PYTHON_PYCUPS_SOURCE = pycups-$(PYTHON_PYCUPS_VERSION).tar.gz
-PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/96/c4/b077f0422cd031e4f3a47c75ce0bcf77f2f2e5bf3648f6945a4d09fd44a5
+PYTHON_PYCUPS_SITE = $(call pypi,pycups)
 PYTHON_PYCUPS_SETUP_TYPE = setuptools
 PYTHON_PYCUPS_LICENSE = GPL-2.0+
 PYTHON_PYCUPS_LICENSE_FILES = COPYING
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 94cc264b44..682853f706 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYDAL_VERSION = 20260313.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/51/c6ae7cfa615718812f974560b24001aff542ee6739232fd689e87ba75b1f
+PYTHON_PYDAL_SITE = $(call pypi,pydal)
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 333c73a21a..e5821cbab1 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -8,7 +8,7 @@
 # make sure to sync pydantic-core to this version when updating pydantic
 PYTHON_PYDANTIC_CORE_VERSION = 2.46.3
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_PYDANTIC_CORE_SITE = $(call pypi,python-pydantic-core)
 PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 10d79b46b7..89d3c10148 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYDANTIC_SETTINGS_VERSION = 2.14.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666
+PYTHON_PYDANTIC_SETTINGS_SITE = $(call pypi,pydantic_settings)
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 71652bed0b..60595fe85c 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYDANTIC_VERSION = 2.13.3
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a
+PYTHON_PYDANTIC_SITE = $(call pypi,pydantic)
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 8a22aebe22..771c69a0c1 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYDYF_VERSION = 0.12.1
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/36/ee/fb410c5c854b6a081a49077912a9765aeffd8e07cbb0663cfda310b01fb4
+PYTHON_PYDYF_SITE = $(call pypi,pydyf)
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 19fef11515..e1083fc280 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYELFTOOLS_VERSION = 0.32
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/b9/ab/33968940b2deb3d92f5b146bc6d4009a5f95d1d06c148ea2f9ee965071af
+PYTHON_PYELFTOOLS_SITE = $(call pypi,pyelftools)
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python-pyfatfs/python-pyfatfs.mk b/package/python-pyfatfs/python-pyfatfs.mk
index a61fb1afb2..4d06747b7a 100644
--- a/package/python-pyfatfs/python-pyfatfs.mk
+++ b/package/python-pyfatfs/python-pyfatfs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYFATFS_VERSION = 1.1.0
 PYTHON_PYFATFS_SOURCE = pyfatfs-$(PYTHON_PYFATFS_VERSION).tar.gz
-PYTHON_PYFATFS_SITE = https://files.pythonhosted.org/packages/44/3f/d08f1dbc44a7eef9c7fb355b83423fbd15bb3e487c250479a2c179cb39bf
+PYTHON_PYFATFS_SITE = $(call pypi,pyfatfs)
 PYTHON_PYFATFS_LICENSE = MIT
 PYTHON_PYFATFS_LICENSE_FILES = LICENSE
 PYTHON_PYFATFS_SETUP_TYPE = setuptools
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 97ef003b85..6320d0e15b 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYFTPDLIB_VERSION = 2.2.0
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/f9/42/8751c5f58ae59b09e070da4fa322ae9693a340d2cc456b5a380b2c1ee47a
+PYTHON_PYFTPDLIB_SITE = $(call pypi,pyftpdlib)
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 1daf0db176..88ff6b9b94 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYGMENTS_VERSION = 2.20.0
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c
+PYTHON_PYGMENTS_SITE = $(call pypi,pygments)
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index 712fc8af3d..7855dea5fb 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYHAMCREST_VERSION = 2.1.0
 PYTHON_PYHAMCREST_SOURCE = pyhamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/16/3f/f286caba4e64391a8dc9200e6de6ce0d07471e3f718248c3276843b7793b
+PYTHON_PYHAMCREST_SITE = $(call pypi,pyhamcrest)
 PYTHON_PYHAMCREST_SETUP_TYPE = hatch
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 002f572b18..e09e136162 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYICU_VERSION = 2.16.2
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/b7/d5/354eb1bf84dcf4ab0bfa46f0620ecf68fe313bb082c26872ceb7a5021f94
+PYTHON_PYICU_SITE = $(call pypi,pyicu)
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
index 61666e8b49..038e5d4424 100644
--- a/package/python-pyinotify/python-pyinotify.mk
+++ b/package/python-pyinotify/python-pyinotify.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYINOTIFY_VERSION = 0.9.6
 PYTHON_PYINOTIFY_SOURCE = pyinotify-$(PYTHON_PYINOTIFY_VERSION).tar.gz
-PYTHON_PYINOTIFY_SITE = https://files.pythonhosted.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1
+PYTHON_PYINOTIFY_SITE = $(call pypi,pyinotify)
 PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
 PYTHON_PYINOTIFY_LICENSE = MIT
 PYTHON_PYINOTIFY_LICENSE_FILES = COPYING
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 268d83a487..cf925fea47 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYJWT_VERSION = 2.12.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
+PYTHON_PYJWT_SITE = $(call pypi,pyjwt)
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 483ac773c4..d813d0680a 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYLIBFDT_VERSION = 1.7.2.post1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/a2/b8/ef881f0e76af7727ca9c5e27a121db69667c69e4e91eceaafe97f3666a6c
+PYTHON_PYLIBFDT_SITE = $(call pypi,pylibfdt)
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index e6c138bbf1..4167172e3d 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYLIBFTDI_VERSION = 0.23.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/9d/f0/551ccbd8e989e898707e0e0859344fcf538c2310521847a1035ad3e9b164
+PYTHON_PYLIBFTDI_SITE = $(call pypi,pylibftdi)
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 39c7c620d4..77a145a94b 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYLRU_VERSION = 1.3.1
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/76/5f/1c22971415233fa6132453fa8b5a7464b7b7af004a2f236717de403a42c6
+PYTHON_PYLRU_SITE = $(call pypi,pylru)
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 2d969b0f65..0293be6bd8 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYMODBUS_VERSION = 3.13.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/3d/55/eee0782c2ca9fa8e7c3218caca22fe30e850cd6c0c0d475c10b8c19e5a36
+PYTHON_PYMODBUS_SITE = $(call pypi,pymodbus)
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 1d6ad78bce..bf009542c0 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -7,7 +7,7 @@
 # python-pymupdf's version must be compatible with mupdf's version
 PYTHON_PYMUPDF_VERSION = 1.23.22
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/05/20/a0d1221d8f379afcc12b4d1687a8f4adb69eef659e835d781c3fa331ff46
+PYTHON_PYMUPDF_SITE = $(call pypi,PyMuPDF)
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index ce848d8e1b..031ac94ae0 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYMYSQL_VERSION = 1.1.2
 PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/f5/ae/1fe3fcd9f959efa0ebe200b8de88b5a5ce3e767e38c7ac32fb179f16a388
+PYTHON_PYMYSQL_SITE = $(call pypi,pymysql)
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 38484717f6..58b2f3e919 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYNACL_VERSION = 1.6.2
 PYTHON_PYNACL_SOURCE = pynacl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/d9/9a/4019b524b03a13438637b11538c82781a5eda427394380381af8f04f467a
+PYTHON_PYNACL_SITE = $(call pypi,pynacl)
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
diff --git a/package/python-pyndiff/python-pyndiff.mk b/package/python-pyndiff/python-pyndiff.mk
index e25374956c..682cb81e01 100644
--- a/package/python-pyndiff/python-pyndiff.mk
+++ b/package/python-pyndiff/python-pyndiff.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYNDIFF_VERSION = 1.0.2
 PYTHON_PYNDIFF_SOURCE = pyndiff-$(PYTHON_PYNDIFF_VERSION).tar.gz
-PYTHON_PYNDIFF_SITE = https://files.pythonhosted.org/packages/83/3b/fb13918710c4fba40367140f22e3449998f4f66869a7564d0e547ad99ef8
+PYTHON_PYNDIFF_SITE = $(call pypi,pyndiff)
 PYTHON_PYNDIFF_SETUP_TYPE = setuptools
 PYTHON_PYNDIFF_LICENSE = Apache-2.0
 PYTHON_PYNDIFF_LICENSE_FILES = LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index da31da5c5a..9f49a8c6ba 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYOPENSSL_VERSION = 26.1.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
+PYTHON_PYOPENSSL_SITE = $(call pypi,pyopenssl)
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 45ae7818c4..b91aff7828 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPA_BUILD_VERSION = 1.3.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/25/1c/23e33405a7c9eac261dff640926b8b5adaed6a6eb3e1767d441ed611d0c0
+PYTHON_PYPA_BUILD_SITE = $(call pypi,build)
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 316b864302..d067fd91ac 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPARSING_VERSION = 3.3.2
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f
+PYTHON_PYPARSING_SITE = $(call pypi,pyparsing)
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index e8b15fecf7..b7832060ea 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPARTED_VERSION = 3.13.0
 PYTHON_PYPARTED_SOURCE = pyparted-$(PYTHON_PYPARTED_VERSION).tar.gz
-PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/e7/53/b02306f89dc3eaf949659e8814545cde575867bc0175f60361809af7f71a
+PYTHON_PYPARTED_SITE = $(call pypi,pyparted)
 PYTHON_PYPARTED_SETUP_TYPE = setuptools
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = LICENSE
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 8db0518aa4..6f65f08228 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPHEN_VERSION = 0.17.2
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/69/56/e4d7e1bd70d997713649c5ce530b2d15a5fc2245a74ca820fc2d51d89d4d
+PYTHON_PYPHEN_SITE = $(call pypi,pyphen)
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 9b920e75a3..ba72b80df6 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.5
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/c2/06/89fe5fff93c5a01dbdeb9f3d843a7e997dc6e3a87222a260a164ff91fb81
+PYTHON_PYPIKA_TORTOISE_SITE = $(call pypi,pypika_tortoise)
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
diff --git a/package/python-pypng/python-pypng.mk b/package/python-pypng/python-pypng.mk
index 07ad16b67b..78c99f986b 100644
--- a/package/python-pypng/python-pypng.mk
+++ b/package/python-pypng/python-pypng.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPNG_VERSION = 0.20220715.0
 PYTHON_PYPNG_SOURCE = pypng-$(PYTHON_PYPNG_VERSION).tar.gz
-PYTHON_PYPNG_SITE = https://files.pythonhosted.org/packages/93/cd/112f092ec27cca83e0516de0a3368dbd9128c187fb6b52aaaa7cde39c96d
+PYTHON_PYPNG_SITE = $(call pypi,pypng)
 PYTHON_PYPNG_SETUP_TYPE = setuptools
 PYTHON_PYPNG_LICENSE = MIT
 PYTHON_PYPNG_LICENSE_FILES = LICENCE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
index ccb5c659d0..614413fa65 100644
--- a/package/python-pyproj/python-pyproj.mk
+++ b/package/python-pyproj/python-pyproj.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPROJ_VERSION = 3.7.2
 PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
-PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/04/90/67bd7260b4ea9b8b20b4f58afef6c223ecb3abf368eb4ec5bc2cdef81b49
+PYTHON_PYPROJ_SITE = $(call pypi,pyproj)
 PYTHON_PYPROJ_SETUP_TYPE = setuptools
 PYTHON_PYPROJ_LICENSE = MIT
 PYTHON_PYPROJ_LICENSE_FILES = LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
index 7edbd64294..652c30725e 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.mk
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPROJECT_HOOKS_VERSION = 1.2.0
 PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
-PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/e7/82/28175b2414effca1cdac8dc99f76d660e7a4fb0ceefa4b4ab8f5f6742925
+PYTHON_PYPROJECT_HOOKS_SITE = $(call pypi,pyproject_hooks)
 PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
 PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
 PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 8e234f9be5..0f3e4dc2f8 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYPROJECT_METADATA_VERSION = 0.11.0
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/83/fa/8bf4fa41adfebd95dce360afe3f5fca243a17932089d3d5486e95ca44c57
+PYTHON_PYPROJECT_METADATA_SITE = $(call pypi,pyproject_metadata)
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
index 6dfe1afa6d..a8f2693bb3 100644
--- a/package/python-pyqrcode/python-pyqrcode.mk
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYQRCODE_VERSION = 1.2.1
 PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
-PYTHON_PYQRCODE_SITE = https://files.pythonhosted.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
+PYTHON_PYQRCODE_SITE = $(call pypi,PyQRCode)
 PYTHON_PYQRCODE_SETUP_TYPE = setuptools
 PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
 PYTHON_PYQRCODE_LICENSE_FILES = setup.py
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 7360e6dd48..4c05c0e612 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -15,7 +15,7 @@
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
 PYTHON_PYQT5_SIP_VERSION = 12.18.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/f3/31/5ef342de9faee0f3801088946ae103db9b9eaeba3d6a64fefd5ce74df244
+PYTHON_PYQT5_SIP_SITE = $(call pypi,python-pyqt5-sip)
 PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 1ab9cea4ad..f1670a24b0 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYQT5_VERSION = 5.15.6
 PYTHON_PYQT5_SOURCE = PyQt5-$(PYTHON_PYQT5_VERSION).tar.gz
-PYTHON_PYQT5_SITE = https://files.pythonhosted.org/packages/3b/27/fd81188a35f37be9b3b4c2db1654d9439d1418823916fe702ac3658c9c41
+PYTHON_PYQT5_SITE = $(call pypi,PyQt5)
 PYTHON_PYQT5_LICENSE = GPL-3.0
 PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index dabf7e923d..40ac5192f8 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYROUTE2_VERSION = 0.9.6
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9b/3c/cae3aa8a07522d4fd625958f690ab6eb4ffbd9c94e30e2995f585fded630
+PYTHON_PYROUTE2_SITE = $(call pypi,pyroute2)
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index 6c52d7dbc8..b024aedd56 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYRSISTENT_VERSION = 0.20.0
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/ce/3a/5031723c09068e9c8c2f0bc25c3a9245f2b1d1aea8396c787a408f2b95ca
+PYTHON_PYRSISTENT_SITE = $(call pypi,pyrsistent)
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
diff --git a/package/python-pysendfile/python-pysendfile.mk b/package/python-pysendfile/python-pysendfile.mk
index 6c2d06e367..90213a8584 100644
--- a/package/python-pysendfile/python-pysendfile.mk
+++ b/package/python-pysendfile/python-pysendfile.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSENDFILE_VERSION = 2.0.1
 PYTHON_PYSENDFILE_SOURCE = pysendfile-$(PYTHON_PYSENDFILE_VERSION).tar.gz
-PYTHON_PYSENDFILE_SITE = https://files.pythonhosted.org/packages/cd/3f/4aa268afd0252f06b3b487c296a066a01ddd4222a46b7a3748599c8fc8c3
+PYTHON_PYSENDFILE_SITE = $(call pypi,pysendfile)
 PYTHON_PYSENDFILE_SETUP_TYPE = setuptools
 PYTHON_PYSENDFILE_LICENSE = MIT
 PYTHON_PYSENDFILE_LICENSE_FILES = LICENSE
diff --git a/package/python-pysensors/python-pysensors.mk b/package/python-pysensors/python-pysensors.mk
index b38c47f0c8..af747edfd8 100644
--- a/package/python-pysensors/python-pysensors.mk
+++ b/package/python-pysensors/python-pysensors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSENSORS_VERSION = 0.0.4
 PYTHON_PYSENSORS_SOURCE = PySensors-$(PYTHON_PYSENSORS_VERSION).tar.gz
-PYTHON_PYSENSORS_SITE = https://files.pythonhosted.org/packages/76/31/d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5
+PYTHON_PYSENSORS_SITE = $(call pypi,PySensors)
 PYTHON_PYSENSORS_SETUP_TYPE = setuptools
 PYTHON_PYSENSORS_LICENSE = LGPL-2.1
 
diff --git a/package/python-pysftp/python-pysftp.mk b/package/python-pysftp/python-pysftp.mk
index 4841afd000..b1131bb623 100644
--- a/package/python-pysftp/python-pysftp.mk
+++ b/package/python-pysftp/python-pysftp.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSFTP_VERSION = 0.2.9
 PYTHON_PYSFTP_SOURCE = pysftp-$(PYTHON_PYSFTP_VERSION).tar.gz
-PYTHON_PYSFTP_SITE = https://files.pythonhosted.org/packages/36/60/45f30390a38b1f92e0a8cf4de178cd7c2bc3f874c85430e40ccf99df8fe7
+PYTHON_PYSFTP_SITE = $(call pypi,pysftp)
 PYTHON_PYSFTP_SETUP_TYPE = setuptools
 PYTHON_PYSFTP_LICENSE = BSD-3-Clause
 PYTHON_PYSFTP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 9c8da126c1..c07e811bf7 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSMB_VERSION = 1.2.13
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/de/79/f9a2f2f3aea92ae5647079fcbf28e3969de9af7953bef10e31898fe435e2
+PYTHON_PYSMB_SITE = $(call pypi,pysmb)
 PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 2288f04e88..b1543ed5b5 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSMI_VERSION = 1.6.2
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a7/80/917111aaa4bf931bbd4d9a6c89864de2304b79cba8ce49639a6440ecd5ba
+PYTHON_PYSMI_SITE = $(call pypi,pysmi)
 PYTHON_PYSMI_SETUP_TYPE = flit
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index eb9119a352..8757e7fae9 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
-PYTHON_PYSNMP_MIBS_SITE = https://files.pythonhosted.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
+PYTHON_PYSNMP_MIBS_SITE = $(call pypi,pysnmp-mibs)
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index e82ba2bdcb..9e50f60a5a 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMP_VERSION = 7.1.22
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c5/f7/63a4833b675f3f85296d85f2fddaed93d76799f29a813a2d5ca2bbe7fc50
+PYTHON_PYSNMP_SITE = $(call pypi,pysnmp)
 PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
index f58bff1136..1d60f5a25a 100644
--- a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMPCRYPTO_VERSION = 0.1.0
 PYTHON_PYSNMPCRYPTO_SOURCE = pysnmpcrypto-$(PYTHON_PYSNMPCRYPTO_VERSION).tar.gz
-PYTHON_PYSNMPCRYPTO_SITE = https://files.pythonhosted.org/packages/e6/70/b71f5f1321ea548a7152fc23926258caaec353c8c3edce1aaafbb030ba76
+PYTHON_PYSNMPCRYPTO_SITE = $(call pypi,pysnmpcrypto)
 PYTHON_PYSNMPCRYPTO_SETUP_TYPE = poetry
 PYTHON_PYSNMPCRYPTO_LICENSE = BSD-2-Clause
 PYTHON_PYSNMPCRYPTO_LICENSE_FILES = LICENSE.rst
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index 1925220d23..4e41ddd708 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSOCKS_VERSION = 1.7.1
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
-PYTHON_PYSOCKS_SITE = https://files.pythonhosted.org/packages/bd/11/293dd436aea955d45fc4e8a35b6ae7270f5b8e00b53cf6c024c83b657a11
+PYTHON_PYSOCKS_SITE = $(call pypi,PySocks)
 PYTHON_PYSOCKS_LICENSE = BSD-3-Clause
 PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
 PYTHON_PYSOCKS_SETUP_TYPE = setuptools
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index ebe74bd879..c0f0ce1ce3 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSPNEGO_VERSION = 0.12.1
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/7d/84/58577bd1b14293650879de0579ec263a1d8350f1d6d227226cf776b5a6a6
+PYTHON_PYSPNEGO_SITE = $(call pypi,pyspnego)
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index 40614472a6..0a3cf9790e 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTABLEREADER_VERSION = 0.31.4
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/0a/44/e42c24df7b6f1c880b5bf614112e2009ac088fee79b6bc4d1fa43789c460
+PYTHON_PYTABLEREADER_SITE = $(call pypi,pytablereader)
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 6c22d750a0..37dabca61f 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTABLEWRITER_VERSION = 1.2.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/f6/a1/617730f290f04d347103ab40bf67d317df6691b14746f6e1ea039fb57062
+PYTHON_PYTABLEWRITER_SITE = $(call pypi,pytablewriter)
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index da0bbfeb81..0ac6c08473 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
+PYTHON_PYTEST_ASYNCIO_SITE = $(call pypi,pytest_asyncio)
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index e949eff8a4..d6a8939978 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTEST_VERSION = 9.0.3
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/7d/0d/549bd94f1a0a402dc8cf64563a117c0f3765662e2e668477624baeec44d5
+PYTHON_PYTEST_SITE = $(call pypi,pytest)
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 271824585a..5be6951057 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTHRAN_VERSION = 0.18.1
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/d4/84/17c4c44a24f5ec709991e603e601bf316d09c4fe915fbe348c689dede998
+PYTHON_PYTHRAN_SITE = $(call pypi,pythran)
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index 7e55579d2d..043cea3970 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -8,7 +8,7 @@ PYTHON_PYTRIE_VERSION = 0.4.0
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
 PYTHON_PYTRIE_LICENSE = BSD-3-Clause
 PYTHON_PYTRIE_LICENSE_FILES = LICENSE
-PYTHON_PYTRIE_SITE = https://files.pythonhosted.org/packages/d3/19/15ec77ab9c85f7c36eb590d6ab7dd529f8c8516c0e2219f1a77a99d7ee77
+PYTHON_PYTRIE_SITE = $(call pypi,PyTrie)
 PYTHON_PYTRIE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index e095caffac..0c9672e920 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYTZ_VERSION = 2026.1.post1
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/56/db/b8721d71d945e6a8ac63c0fc900b2067181dbb50805958d4d4661cf7d277
+PYTHON_PYTZ_SITE = $(call pypi,pytz)
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index a83fe70a48..8ee811aab4 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYUDEV_VERSION = 0.24.4
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
+PYTHON_PYUDEV_SITE = $(call pypi,pyudev)
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index cce48e0df8..fc1d367892 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYUSB_VERSION = 1.3.1
 PYTHON_PYUSB_SOURCE = pyusb-$(PYTHON_PYUSB_VERSION).tar.gz
-PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/00/6b/ce3727395e52b7b76dfcf0c665e37d223b680b9becc60710d4bc08b7b7cb
+PYTHON_PYUSB_SITE = $(call pypi,pyusb)
 PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index bfbf5276a6..3a3f727e02 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYYAML_VERSION = 6.0.3
 PYTHON_PYYAML_SOURCE = pyyaml-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2
+PYTHON_PYYAML_SITE = $(call pypi,pyyaml)
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 48a298b221..477dd8741a 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYZMQ_VERSION = 25.1.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3a/33/1a3683fc9a4bd64d8ccc0290da75c8f042184a1a49c146d28398414d3341
+PYTHON_PYZMQ_SITE = $(call pypi,pyzmq)
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 72c54b5339..1c2e6de808 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -6,7 +6,7 @@
 
 PYTHON_QRCODE_VERSION = 8.2
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/8f/b2/7fc2931bfae0af02d5f53b174e9cf701adbb35f39d69c2af63d4a39f81a9
+PYTHON_QRCODE_SITE = $(call pypi,qrcode)
 PYTHON_QRCODE_SETUP_TYPE = poetry
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
index ff6c22c00a..c7f63c4e8a 100644
--- a/package/python-raven/python-raven.mk
+++ b/package/python-raven/python-raven.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RAVEN_VERSION = 6.10.0
 PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
-PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/79/57/b74a86d74f96b224a477316d418389af9738ba7a63c829477e7a86dd6f47
+PYTHON_RAVEN_SITE = $(call pypi,raven)
 PYTHON_RAVEN_SETUP_TYPE = setuptools
 PYTHON_RAVEN_LICENSE = BSD-3-Clause
 PYTHON_RAVEN_LICENSE_FILES = LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 21dd6f1994..7d261050ae 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REDIS_VERSION = 7.4.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7b/7f/3759b1d0d72b7c92f0d70ffd9dc962b7b7b5ee74e135f9d7d8ab06b8a318
+PYTHON_REDIS_SITE = $(call pypi,redis)
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
index f5eea7eaa4..19900bb47d 100644
--- a/package/python-reedsolo/python-reedsolo.mk
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REEDSOLO_VERSION = 2.0.13
 PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
-PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/57/5b/ead15a5d182553f9d7832851a954b7f0d662d710972b0d1c479fd11a3ebd
+PYTHON_REEDSOLO_SITE = $(call pypi,reedsolo)
 PYTHON_REEDSOLO_SETUP_TYPE = setuptools
 PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
 PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index 5808eee4a2..dc371f90e3 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REENTRY_VERSION = 1.3.3
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/95/20/e820a29014f1cb662423d7001dc09a9ea5280083ea300f0c5efe5cae238b
+PYTHON_REENTRY_SITE = $(call pypi,reentry)
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index b998779132..b613d0f4ea 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REFERENCING_VERSION = 0.37.0
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f
+PYTHON_REFERENCING_SITE = $(call pypi,referencing)
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 44c12789bf..72f6d23107 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REGEX_VERSION = 2026.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cb/0e/3a246dbf05666918bd3664d9d787f84a9108f6f43cc953a077e4a7dfdb7e
+PYTHON_REGEX_SITE = $(call pypi,regex)
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-request-id/python-request-id.mk b/package/python-request-id/python-request-id.mk
index 8fe8dc04fb..c0d8d5cb44 100644
--- a/package/python-request-id/python-request-id.mk
+++ b/package/python-request-id/python-request-id.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REQUEST_ID_VERSION = 1.0.1
 PYTHON_REQUEST_ID_SOURCE = request-id-$(PYTHON_REQUEST_ID_VERSION).tar.gz
-PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/9b/b3/30617b85b1766b6a804f2b8abc0ca7496f6349236f7eec28cb42687ca8e3
+PYTHON_REQUEST_ID_SITE = $(call pypi,request-id)
 PYTHON_REQUEST_ID_SETUP_TYPE = setuptools
 PYTHON_REQUEST_ID_LICENSE = MIT
 PYTHON_REQUEST_ID_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index 823b8140fb..7f88d568eb 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REQUESTS_OAUTHLIB_VERSION = 2.0.0
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/42/f2/05f29bc3913aea15eb670be136045bf5c5bbf4b99ecb839da9b422bb2c85
+PYTHON_REQUESTS_OAUTHLIB_SITE = $(call pypi,requests-oauthlib)
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index d0bcb1bb21..f492a3432e 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REQUESTS_TOOLBELT_VERSION = 1.0.0
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/f3/61/d7545dafb7ac2230c70d38d31cbfe4cc64f7144dc41f6e4e4b78ecd9f5bb
+PYTHON_REQUESTS_TOOLBELT_SITE = $(call pypi,requests-toolbelt)
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 3af00a7b9b..abf0cd359c 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -6,7 +6,7 @@
 
 PYTHON_REQUESTS_VERSION = 2.33.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
+PYTHON_REQUESTS_SITE = $(call pypi,requests)
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
diff --git a/package/python-rfc3987/python-rfc3987.mk b/package/python-rfc3987/python-rfc3987.mk
index cad17e8de2..6e69cf83d3 100644
--- a/package/python-rfc3987/python-rfc3987.mk
+++ b/package/python-rfc3987/python-rfc3987.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RFC3987_VERSION = 1.3.8
 PYTHON_RFC3987_SOURCE = rfc3987-$(PYTHON_RFC3987_VERSION).tar.gz
-PYTHON_RFC3987_SITE = https://files.pythonhosted.org/packages/14/bb/f1395c4b62f251a1cb503ff884500ebd248eed593f41b469f89caa3547bd
+PYTHON_RFC3987_SITE = $(call pypi,rfc3987)
 PYTHON_RFC3987_SETUP_TYPE = setuptools
 PYTHON_RFC3987_LICENSE = GPL-3.0+
 PYTHON_RFC3987_LICENSE_FILES = COPYING.txt
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index cb98d0ff3e..8439ad2580 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RICH_VERSION = 15.0.0
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9
+PYTHON_RICH_SITE = $(call pypi,rich)
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 12ff7e1fb9..6074bff3d4 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -7,7 +7,7 @@
 PYTHON_RPDS_PY_VERSION = 0.30.0
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
 PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced
-PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_RPDS_PY_SITE = $(call pypi,python-rpds-py)
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
index 4e62e07533..d9f3e51555 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RPI_GPIO_VERSION = 0.7.1
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
-PYTHON_RPI_GPIO_SITE = https://files.pythonhosted.org/packages/c4/0f/10b524a12b3445af1c607c27b2f5ed122ef55756e29942900e5c950735f2
+PYTHON_RPI_GPIO_SITE = $(call pypi,RPi.GPIO)
 PYTHON_RPI_GPIO_LICENSE = MIT
 PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
 PYTHON_RPI_GPIO_SETUP_TYPE = setuptools
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 610467b160..fbd7a52411 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RPI_WS281X_VERSION = 5.0.0
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/c0/1e/642208a685c5e96d38323f42c75d9b24f95e2d1b8390dd104e04a712f29e
+PYTHON_RPI_WS281X_SITE = $(call pypi,rpi_ws281x)
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index aedf19da8e..0f192214fa 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RSA_VERSION = 4.9.1
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/da/8a/22b7beea3ee0d44b1916c0c1cb0ee3af23b700b6da9f04991899d0c555d4
+PYTHON_RSA_SITE = $(call pypi,rsa)
 PYTHON_RSA_SETUP_TYPE = poetry
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index d5de20f832..64ca6fc060 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -7,7 +7,7 @@
 PYTHON_RTOML_VERSION = 0.10.0
 PYTHON_RTOML_SOURCE_PYPI = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
 PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
-PYTHON_RTOML_SITE = $(PYTHON_RTOML_SITE_PYPI)/$(PYTHON_RTOML_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_RTOML_SITE = $(call pypi,python-rtoml)
 PYTHON_RTOML_SETUP_TYPE = maturin
 PYTHON_RTOML_LICENSE = MIT
 PYTHON_RTOML_LICENSE_FILES = LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index 0eb34e169f..175c64f8c6 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.15
 PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel_yaml_clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/ea/97/60fda20e2fb54b83a61ae14648b0817c8f5d84a3821e40bfbdae1437026a
+PYTHON_RUAMEL_YAML_CLIB_SITE = $(call pypi,ruamel_yaml_clib)
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index b1f7a3e039..7464a7b615 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_RUAMEL_YAML_VERSION = 0.19.0
 PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c
+PYTHON_RUAMEL_YAML_SITE = $(call pypi,ruamel_yaml)
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index f0416bab90..d43c9034b4 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -6,7 +6,7 @@
 
 PYTHON_S3TRANSFER_VERSION = 0.17.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/9b/ec/7c692cde9125b77e84b307354d4fb705f98b8ccad59a036d5957ca75bfc3
+PYTHON_S3TRANSFER_SITE = $(call pypi,s3transfer)
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
index f205fe3b78..e1e936a87b 100644
--- a/package/python-scandir/python-scandir.mk
+++ b/package/python-scandir/python-scandir.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SCANDIR_VERSION = 1.10.0
 PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
-PYTHON_SCANDIR_SITE = https://files.pythonhosted.org/packages/df/f5/9c052db7bd54d0cbf1bc0bb6554362bba1012d03e5888950a4f5c5dadc4e
+PYTHON_SCANDIR_SITE = $(call pypi,scandir)
 PYTHON_SCANDIR_LICENSE = BSD-3-Clause
 PYTHON_SCANDIR_LICENSE_FILES = LICENSE.txt
 PYTHON_SCANDIR_SETUP_TYPE = setuptools
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 9df4614b9c..16abe2d8f0 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SCAPY_VERSION = 2.7.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/82/97/7caec64f05eae3d305d83e7cce1ef2f337710513b89efb334f7278202e79
+PYTHON_SCAPY_SITE = $(call pypi,scapy)
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index f78b2dcb11..6df9b984e1 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SCHEDULE_VERSION = 1.2.2
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/0c/91/b525790063015759f34447d4cf9d2ccb52cdee0f1dd6ff8764e863bcb74c
+PYTHON_SCHEDULE_SITE = $(call pypi,schedule)
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 8c536df130..5a8a0d3eae 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SCIPY_VERSION = 1.17.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
+PYTHON_SCIPY_SITE = $(call pypi,scipy)
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
index d223b16290..76dafee5c4 100644
--- a/package/python-scp/python-scp.mk
+++ b/package/python-scp/python-scp.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SCP_VERSION = 0.15.0
 PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
-PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/d6/1c/d213e1c6651d0bd37636b21b1ba9b895f276e8057f882c9f944931e4f002
+PYTHON_SCP_SITE = $(call pypi,scp)
 PYTHON_SCP_SETUP_TYPE = setuptools
 PYTHON_SCP_LICENSE = LGPL-2.1+
 PYTHON_SCP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
index 62d128b264..fd659f7f62 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.3
 PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/38/2c/d66aa7f981df1d654bf70942964a4ca24cf930815fe7d656e1979c44a33a
+PYTHON_SDBUS_MODEMMANAGER_SITE = $(call pypi,sdbus_modemmanager)
 PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = poetry
 PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
diff --git a/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk
index 2ad93852fc..0f8f021a9f 100644
--- a/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk
+++ b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SDBUS_NETWORKMANAGER_VERSION = 2.0.0
 PYTHON_SDBUS_NETWORKMANAGER_SOURCE = sdbus-networkmanager-$(PYTHON_SDBUS_NETWORKMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/31/ab/e864c6c2eb778c194cfb56cd9d98b5594dc00573210fdf6b44904745a0bf
+PYTHON_SDBUS_NETWORKMANAGER_SITE = $(call pypi,sdbus-networkmanager)
 PYTHON_SDBUS_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_SDBUS_NETWORKMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_NETWORKMANAGER_LICENSE_FILES = COPYING
diff --git a/package/python-sdbus-systemd/python-sdbus-systemd.mk b/package/python-sdbus-systemd/python-sdbus-systemd.mk
index 0599d2794a..eaff885b5b 100644
--- a/package/python-sdbus-systemd/python-sdbus-systemd.mk
+++ b/package/python-sdbus-systemd/python-sdbus-systemd.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SDBUS_SYSTEMD_VERSION = 1.0.0
 PYTHON_SDBUS_SYSTEMD_SOURCE = sdbus-systemd-$(PYTHON_SDBUS_SYSTEMD_VERSION).tar.gz
-PYTHON_SDBUS_SYSTEMD_SITE = https://files.pythonhosted.org/packages/e1/84/911de0ea63a0dab814dc94f73e7b916bfd4675e1e983b58a725a26a65db4
+PYTHON_SDBUS_SYSTEMD_SITE = $(call pypi,sdbus-systemd)
 PYTHON_SDBUS_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SDBUS_SYSTEMD_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_SYSTEMD_LICENSE_FILES = COPYING.LESSER
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 685626ffb4..3e5e92dd90 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SDBUS_VERSION = 0.14.2
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/7c/0f/0cf6b2fb0338fb3ab564cb8a8d68aa1c6de767851f5f9de9a3c83dbabeab
+PYTHON_SDBUS_SITE = $(call pypi,sdbus)
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
diff --git a/package/python-sdnotify/python-sdnotify.mk b/package/python-sdnotify/python-sdnotify.mk
index 4e250eee95..3078ec8b50 100644
--- a/package/python-sdnotify/python-sdnotify.mk
+++ b/package/python-sdnotify/python-sdnotify.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SDNOTIFY_VERSION = 0.3.2
 PYTHON_SDNOTIFY_SOURCE = sdnotify-$(PYTHON_SDNOTIFY_VERSION).tar.gz
-PYTHON_SDNOTIFY_SITE = https://files.pythonhosted.org/packages/ce/d8/9fdc36b2a912bf78106de4b3f0de3891ff8f369e7a6f80be842b8b0b6bd5
+PYTHON_SDNOTIFY_SITE = $(call pypi,sdnotify)
 PYTHON_SDNOTIFY_SETUP_TYPE = setuptools
 PYTHON_SDNOTIFY_LICENSE = MIT
 PYTHON_SDNOTIFY_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index 0f1c3c62f1..ab43850bcb 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SECRETSTORAGE_VERSION = 3.5.0
 PYTHON_SECRETSTORAGE_SOURCE = secretstorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/1c/03/e834bcd866f2f8a49a85eaff47340affa3bfa391ee9912a952a1faa68c7b
+PYTHON_SECRETSTORAGE_SITE = $(call pypi,secretstorage)
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index f1fc76945f..617e75927e 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SEGNO_VERSION = 1.6.6
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/1c/2e/b396f750c53f570055bf5a9fc1ace09bed2dff013c73b7afec5702a581ba
+PYTHON_SEGNO_SITE = $(call pypi,segno)
 PYTHON_SEGNO_SETUP_TYPE = flit
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 8308325ffe..d206f11929 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -7,7 +7,7 @@
 PYTHON_SELENIUM_VERSION = 4.39.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
 PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/af/19/27c1bf9eb1f7025632d35a956b50746efb4b10aa87f961b263fa7081f4c5
-PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_SELENIUM_SITE = $(call pypi,python-selenium)
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
 PYTHON_SELENIUM_LICENSE_FILES = LICENSE
diff --git a/package/python-semantic-version/python-semantic-version.mk b/package/python-semantic-version/python-semantic-version.mk
index 76a65e734f..fd97f1b8cf 100644
--- a/package/python-semantic-version/python-semantic-version.mk
+++ b/package/python-semantic-version/python-semantic-version.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SEMANTIC_VERSION_VERSION = 2.10.0
 PYTHON_SEMANTIC_VERSION_SOURCE = semantic_version-$(PYTHON_SEMANTIC_VERSION_VERSION).tar.gz
-PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/7d/31/f2289ce78b9b473d582568c234e104d2a342fd658cc288a7553d83bb8595
+PYTHON_SEMANTIC_VERSION_SITE = $(call pypi,semantic_version)
 PYTHON_SEMANTIC_VERSION_SETUP_TYPE = setuptools
 PYTHON_SEMANTIC_VERSION_LICENSE = BSD-2-Clause
 PYTHON_SEMANTIC_VERSION_LICENSE_FILES = LICENSE
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 3e4b167848..131bb5aab5 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SEMVER_VERSION = 3.0.4
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/72/d1/d3159231aec234a59dd7d601e9dd9fe96f3afff15efd33c1070019b26132
+PYTHON_SEMVER_SITE = $(call pypi,semver)
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 585a1c2cda..1a7b16160d 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SENTRY_SDK_VERSION = 2.58.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/b3/fb8291170d0e844173164709fc0fa0c221ed75a5da740c8746f2a83b4eb1
+PYTHON_SENTRY_SDK_SITE = $(call pypi,sentry_sdk)
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
index 6ee215a81c..3d66018909 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.mk
+++ b/package/python-serial-asyncio/python-serial-asyncio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SERIAL_ASYNCIO_VERSION = 0.6
 PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
-PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/4a/9a/8477699dcbc1882ea51dcff4d3c25aa3f2063ed8f7d7a849fd8f610506b6
+PYTHON_SERIAL_ASYNCIO_SITE = $(call pypi,pyserial-asyncio)
 PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 87cd9392f1..a9c3809d79 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SERIAL_VERSION = 3.5
 PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE = https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082
+PYTHON_SERIAL_SITE = $(call pypi,pyserial)
 PYTHON_SERIAL_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 7965811c6a..6a3943fc5e 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SERVICE_IDENTITY_VERSION = 24.2.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/07/a5/dfc752b979067947261dbbf2543470c58efe735c3c1301dd870ef27830ee
+PYTHON_SERVICE_IDENTITY_SITE = $(call pypi,service_identity)
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 7821eb5225..4b048158e5 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SETPROCTITLE_VERSION = 1.3.7
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/8d/48/49393a96a2eef1ab418b17475fb92b8fcfad83d099e678751b05472e69de
+PYTHON_SETPROCTITLE_SITE = $(call pypi,setproctitle)
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = LICENSE
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 05951260b2..d805aae480 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0c/11/736cfe4ec795dbce001ebdcef5cab03de1727041c805c3a45c1bda9f54a1
+PYTHON_SETUPTOOLS_RUST_SITE = $(call pypi,setuptools_rust)
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8c74a55335..2c9dfc1ab4 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SETUPTOOLS_SCM_VERSION = 9.2.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/7b/b1/19587742aad604f1988a8a362e660e8c3ac03adccdb71c96d86526e5eb62
+PYTHON_SETUPTOOLS_SCM_SITE = $(call pypi,setuptools_scm)
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..525a5cde5d 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SETUPTOOLS_VERSION = 80.9.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = $(call pypi,setuptools)
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 6bbd621af1..a04ae1c0ce 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SH_VERSION = 2.2.2
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/59/52/f43920223c93e31874677c681b8603d36a40d3d8502d3a37f80d3995d43e
+PYTHON_SH_SITE = $(call pypi,sh)
 PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-simple-pid/python-simple-pid.mk b/package/python-simple-pid/python-simple-pid.mk
index ed3bbb329f..81ebf100f8 100644
--- a/package/python-simple-pid/python-simple-pid.mk
+++ b/package/python-simple-pid/python-simple-pid.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLE_PID_VERSION = 2.0.1
 PYTHON_SIMPLE_PID_SOURCE = simple_pid-$(PYTHON_SIMPLE_PID_VERSION).tar.gz
-PYTHON_SIMPLE_PID_SITE = https://files.pythonhosted.org/packages/78/0a/c670a4f4dea4b21c0b074b193c54698e5e047479e688c8d5495d264c9921
+PYTHON_SIMPLE_PID_SITE = $(call pypi,simple_pid)
 PYTHON_SIMPLE_PID_SETUP_TYPE = setuptools
 PYTHON_SIMPLE_PID_LICENSE = MIT
 PYTHON_SIMPLE_PID_LICENSE_FILES = LICENSE.md
diff --git a/package/python-simple-websocket/python-simple-websocket.mk b/package/python-simple-websocket/python-simple-websocket.mk
index a77d9a66f6..b65aef37ed 100644
--- a/package/python-simple-websocket/python-simple-websocket.mk
+++ b/package/python-simple-websocket/python-simple-websocket.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.1.0
 PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple_websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
-PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/b0/d4/bfa032f961103eba93de583b161f0e6a5b63cebb8f2c7d0c6e6efe1e3d2e
+PYTHON_SIMPLE_WEBSOCKET_SITE = $(call pypi,simple_websocket)
 PYTHON_SIMPLE_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_SIMPLE_WEBSOCKET_LICENSE = MIT
 PYTHON_SIMPLE_WEBSOCKET_LICENSE_FILES = LICENSE
diff --git a/package/python-simpleaudio/python-simpleaudio.mk b/package/python-simpleaudio/python-simpleaudio.mk
index 5cdb3a82c3..565f1706da 100644
--- a/package/python-simpleaudio/python-simpleaudio.mk
+++ b/package/python-simpleaudio/python-simpleaudio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLEAUDIO_VERSION = 1.0.4
 PYTHON_SIMPLEAUDIO_SOURCE = simpleaudio-$(PYTHON_SIMPLEAUDIO_VERSION).tar.gz
-PYTHON_SIMPLEAUDIO_SITE = https://files.pythonhosted.org/packages/94/1b/4dc29653733202b68c09d9c6ca085cf67ac54859ee860647ef21ac1ff3dc
+PYTHON_SIMPLEAUDIO_SITE = $(call pypi,simpleaudio)
 PYTHON_SIMPLEAUDIO_LICENSE = MIT
 PYTHON_SIMPLEAUDIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEAUDIO_SETUP_TYPE = setuptools
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 1dc2eacdf7..07531c70ad 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLEJSON_VERSION = 4.1.1
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0e/2a/54837395a3487c725669428d513293612a48d82b95a0642c936932e5d898
+PYTHON_SIMPLEJSON_SITE = $(call pypi,simplejson)
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index 43f2e0781a..105412d8cd 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLELOGGING_VERSION = 0.12.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
-PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/30/71/d6b6513598e6a4300f6142a839d1b0e10a25a4707f1b586d9a6331be91bb
+PYTHON_SIMPLELOGGING_SITE = $(call pypi,simplelogging)
 PYTHON_SIMPLELOGGING_SETUP_TYPE = poetry
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index bf08426310..f54e5b7d13 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIMPLESQLITE_VERSION = 1.5.4
 PYTHON_SIMPLESQLITE_SOURCE = simplesqlite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/1a/73/94ee1a1711ca04c7269f2d32472d10ad8cdc85ebf32c42e1cfc6924d39d8
+PYTHON_SIMPLESQLITE_SITE = $(call pypi,simplesqlite)
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 84ba78161e..5b9789d28a 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIX_VERSION = 1.17.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2
+PYTHON_SIX_SITE = $(call pypi,six)
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 3efe8818f9..fdf8033456 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SMBPROTOCOL_VERSION = 1.16.1
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/33/76/c32681e925fc859578d4e41e4bd3ef7e2b9e7d06141f703eec032875b28a
+PYTHON_SMBPROTOCOL_SITE = $(call pypi,smbprotocol)
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
index 9676670360..05005415b3 100644
--- a/package/python-smbus2/python-smbus2.mk
+++ b/package/python-smbus2/python-smbus2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SMBUS2_VERSION = 0.6.1
 PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
-PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/87/37/b3f7b501502c4915ba3819d1dc277bf3f5fae4a9d067caa4f502aaddd889
+PYTHON_SMBUS2_SITE = $(call pypi,smbus2)
 PYTHON_SMBUS2_SETUP_TYPE = setuptools
 PYTHON_SMBUS2_LICENSE = MIT
 PYTHON_SMBUS2_LICENSE_FILES = LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index e7af384789..66488296cc 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SMMAP2_VERSION = 5.0.3
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/1f/ea/49c993d6dfdd7338c9b1000a0f36817ed7ec84577ae2e52f890d1a4ff909
+PYTHON_SMMAP2_SITE = $(call pypi,smmap)
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index e80aa861df..b8900512c4 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_SNAPPY_VERSION = 0.6.1
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
+PYTHON_SNAPPY_SITE = $(call pypi,python-snappy)
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
index 120794d77c..a1c2511fb0 100644
--- a/package/python-sniffio/python-sniffio.mk
+++ b/package/python-sniffio/python-sniffio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SNIFFIO_VERSION = 1.3.1
 PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
-PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd
+PYTHON_SNIFFIO_SITE = $(call pypi,sniffio)
 PYTHON_SNIFFIO_SETUP_TYPE = setuptools
 PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
 PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 2c6b581c1e..1dbafe76fa 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SOCKETIO_VERSION = 5.16.0
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b8/55/5d8af5884283b58e4405580bcd84af1d898c457173c708736e065f10ca4a
+PYTHON_SOCKETIO_SITE = $(call pypi,python_socketio)
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
diff --git a/package/python-sockjs/python-sockjs.mk b/package/python-sockjs/python-sockjs.mk
index d9cfaf58ff..17073bae1f 100644
--- a/package/python-sockjs/python-sockjs.mk
+++ b/package/python-sockjs/python-sockjs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SOCKJS_VERSION = 0.13.0
 PYTHON_SOCKJS_SOURCE = sockjs-$(PYTHON_SOCKJS_VERSION).tar.gz
-PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/00/a4/644d5901d51aecb9fff218bbfc2525ef9362d4d03c2fcb8cb322aa0ce77f
+PYTHON_SOCKJS_SITE = $(call pypi,sockjs)
 PYTHON_SOCKJS_SETUP_TYPE = setuptools
 PYTHON_SOCKJS_LICENSE = Apache-2.0
 PYTHON_SOCKJS_LICENSE_FILES = LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index 51df517264..bcdd7ca533 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SORTEDCONTAINERS_VERSION = 2.4.0
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111
+PYTHON_SORTEDCONTAINERS_SITE = $(call pypi,sortedcontainers)
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 04d33f67be..3eaba825c8 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SOUPSIEVE_VERSION = 2.8.3
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4
+PYTHON_SOUPSIEVE_SITE = $(call pypi,soupsieve)
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
diff --git a/package/python-spake2/python-spake2.mk b/package/python-spake2/python-spake2.mk
index 0eb91dcf98..b2b4bddea2 100644
--- a/package/python-spake2/python-spake2.mk
+++ b/package/python-spake2/python-spake2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SPAKE2_VERSION = 0.9
 PYTHON_SPAKE2_SOURCE = spake2-$(PYTHON_SPAKE2_VERSION).tar.gz
-PYTHON_SPAKE2_SITE = https://files.pythonhosted.org/packages/c5/4b/32ad65f8ff5c49254e218ccaae8fc16900cfc289954fb372686159ebe315
+PYTHON_SPAKE2_SITE = $(call pypi,spake2)
 PYTHON_SPAKE2_SETUP_TYPE = setuptools
 PYTHON_SPAKE2_LICENSE = MIT
 PYTHON_SPAKE2_LICENSE_FILES = LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index 2f7f7f23fc..6f45d85fd7 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SPIDEV_VERSION = 3.8
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/67/87/039b6eeea781598015b538691bc174cc0bf77df9d4d2d3b8bf9245c0de8c
+PYTHON_SPIDEV_SITE = $(call pypi,spidev)
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 46a180a4d4..702521de43 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SQLALCHEMY_VERSION = 2.0.49
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/09/45/461788f35e0364a8da7bda51a1fe1b09762d0c32f12f63727998d85a873b
+PYTHON_SQLALCHEMY_SITE = $(call pypi,sqlalchemy)
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index a55ae8a0e0..3ffd198b5b 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SQLITESCHEMA_VERSION = 2.0.1
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/90/ad/0d7010b15899d25ee832b89d0d79b501c4d0c7d0d03c06e84c1cd1383326
+PYTHON_SQLITESCHEMA_SITE = $(call pypi,sqliteschema)
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index af1af475d8..c8e0833778 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SQLPARSE_VERSION = 0.5.5
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/90/76/437d71068094df0726366574cf3432a4ed754217b436eb7429415cf2d480
+PYTHON_SQLPARSE_SITE = $(call pypi,sqlparse)
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
index 7c38d2c4eb..a5dcc9d2d7 100644
--- a/package/python-stack-data/python-stack-data.mk
+++ b/package/python-stack-data/python-stack-data.mk
@@ -6,7 +6,7 @@
 
 PYTHON_STACK_DATA_VERSION = 0.6.3
 PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
-PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/28/e3/55dcc2cfbc3ca9c29519eb6884dd1415ecb53b0e934862d3559ddcb7e20b
+PYTHON_STACK_DATA_SITE = $(call pypi,stack_data)
 PYTHON_STACK_DATA_SETUP_TYPE = pep517
 PYTHON_STACK_DATA_LICENSE = MIT
 PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 20126e11ae..933b00a8f6 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -6,7 +6,7 @@
 
 PYTHON_STARLETTE_VERSION = 1.1.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/95/66/4d20cdf39a8d6a51e663b7038e3b828ff211d3891a43a713fe7e4643f3a8
+PYTHON_STARLETTE_SITE = $(call pypi,starlette)
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
index 817b56ddee..09125d3e4f 100644
--- a/package/python-sympy/python-sympy.mk
+++ b/package/python-sympy/python-sympy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SYMPY_VERSION = 1.14.0
 PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
-PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/83/d3/803453b36afefb7c2bb238361cd4ae6125a569b4db67cd9e79846ba2d68c
+PYTHON_SYMPY_SITE = $(call pypi,sympy)
 PYTHON_SYMPY_SETUP_TYPE = setuptools
 PYTHON_SYMPY_LICENSE = BSD-3-Clause
 PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index fdc5d7e278..fdb5769511 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SYSTEMD_VERSION = 235
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
+PYTHON_SYSTEMD_SITE = $(call pypi,systemd-python)
 PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index bf845b7a7b..727ac63aac 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TABLEDATA_VERSION = 1.3.4
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/b2/35/171c8977162f1163368406deddde4c59673b62bd0cb2f34948a02effb075
+PYTHON_TABLEDATA_SITE = $(call pypi,tabledata)
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
index 062c218ef7..a1a38e3077 100644
--- a/package/python-tcolorpy/python-tcolorpy.mk
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TCOLORPY_VERSION = 0.1.7
 PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
-PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/80/cc/44f2d81d8f9093aad81c3467a5bf5718d2b5f786e887b6e4adcfc17ec6b9
+PYTHON_TCOLORPY_SITE = $(call pypi,tcolorpy)
 PYTHON_TCOLORPY_SETUP_TYPE = setuptools
 PYTHON_TCOLORPY_LICENSE = MIT
 PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 7b29e7b13e..fe6f63e96a 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TELNETLIB3_VERSION = 4.0.2
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/2c/1f/a5de9f0f86976d299a439619417019a9674fa8662377659734dd6e067235
+PYTHON_TELNETLIB3_SITE = $(call pypi,telnetlib3)
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index facd72a999..b6ed1a1a84 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TEMPORA_VERSION = 5.8.1
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/24/64/a255efe5edd367d12b770b3514194efdc1c97e5ed6ce6e8105d834750dfc
+PYTHON_TEMPORA_SITE = $(call pypi,tempora)
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index e0ec72c98b..7e8585dc89 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TERMCOLOR_VERSION = 3.3.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/46/79/cf31d7a93a8fdc6aa0fbb665be84426a8c5a557d9240b6239e9e11e35fc5
+PYTHON_TERMCOLOR_SITE = $(call pypi,termcolor)
 PYTHON_TERMCOLOR_SETUP_TYPE = hatch
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index 900a577f36..60bfa0fe92 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
-PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
+PYTHON_TERMINALTABLES_SITE = $(call pypi,terminaltables)
 PYTHON_TERMINALTABLES_SETUP_TYPE = poetry
 PYTHON_TERMINALTABLES_LICENSE = MIT
 PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 1e4e7572c9..98b8b4fa4b 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TEXTTABLE_VERSION = 1.7.0
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/1c/dc/0aff23d6036a4d3bf4f1d8c8204c5c79c4437e25e0ae94ffe4bbb55ee3c2
+PYTHON_TEXTTABLE_SITE = $(call pypi,texttable)
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index d7ada90102..2383a7de73 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TEXTUAL_VERSION = 8.2.5
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
+PYTHON_TEXTUAL_SITE = $(call pypi,textual)
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index db70a07011..48344d6410 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TFTPY_VERSION = 0.8.7
 PYTHON_TFTPY_SOURCE = tftpy-$(PYTHON_TFTPY_VERSION).tar.gz
-PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/4c/4f/92f31ab66baf5147d3c080d1a0820b68bced08a1fe5d3565868118649c81
+PYTHON_TFTPY_SITE = $(call pypi,tftpy)
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index d0c7896f8e..2617eac3fc 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -6,7 +6,7 @@
 
 PYTHON_THRIFT_VERSION = 0.22.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/b2/c2/db648cc10dd7d15560f2eafd92a27cd280811924696e0b4a87175fb28c94
+PYTHON_THRIFT_SITE = $(call pypi,thrift)
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index 39029278a7..a77735e712 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TINYCSS2_VERSION = 1.5.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/a3/ae/2ca4913e5c0f09781d75482874c3a95db9105462a92ddd303c7d285d3df2
+PYTHON_TINYCSS2_SITE = $(call pypi,tinycss2)
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
diff --git a/package/python-tinyhtml5/python-tinyhtml5.mk b/package/python-tinyhtml5/python-tinyhtml5.mk
index 620e36127b..0ee49917f2 100644
--- a/package/python-tinyhtml5/python-tinyhtml5.mk
+++ b/package/python-tinyhtml5/python-tinyhtml5.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TINYHTML5_VERSION = 2.1.0
 PYTHON_TINYHTML5_SOURCE = tinyhtml5-$(PYTHON_TINYHTML5_VERSION).tar.gz
-PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/b1/1f/cfe2f6b30557c92b3f31d41707e09cef5c1efbd87392bc6c0430c46b0e4d
+PYTHON_TINYHTML5_SITE = $(call pypi,tinyhtml5)
 PYTHON_TINYHTML5_SETUP_TYPE = flit
 PYTHON_TINYHTML5_LICENSE = MIT
 PYTHON_TINYHTML5_LICENSE_FILES = LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index 1b3e4a83ed..794938093e 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TINYRPC_VERSION = 1.1.7
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/31/b0d0403cafda7965fab0741bcb7c63b26eab7fcfb605d4ece31a6f7b034d
+PYTHON_TINYRPC_SITE = $(call pypi,tinyrpc)
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index 0e95652165..a36855ae1b 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TOML_VERSION = 0.10.2
 PYTHON_TOML_SOURCE = toml-$(PYTHON_TOML_VERSION).tar.gz
-PYTHON_TOML_SITE = https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c
+PYTHON_TOML_SITE = $(call pypi,toml)
 PYTHON_TOML_SETUP_TYPE = setuptools
 PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
index b8881eb15b..1277826014 100644
--- a/package/python-tomli-w/python-tomli-w.mk
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TOMLI_W_VERSION = 1.2.0
 PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
-PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/19/75/241269d1da26b624c0d5e110e8149093c759b7a286138f4efd61a60e75fe
+PYTHON_TOMLI_W_SITE = $(call pypi,tomli_w)
 PYTHON_TOMLI_W_SETUP_TYPE = flit
 PYTHON_TOMLI_W_LICENSE = MIT
 PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index cab8c5c266..4a0e8ad5c0 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TOMLI_VERSION = 2.4.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/22/de/48c59722572767841493b26183a0d1cc411d54fd759c5607c4590b6563a6
+PYTHON_TOMLI_SITE = $(call pypi,tomli)
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index df7b66f2e1..6018168dfe 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TOMLKIT_VERSION = 0.14.0
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a
+PYTHON_TOMLKIT_SITE = $(call pypi,tomlkit)
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 7b1759bbb6..8cebe43852 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TORNADO_VERSION = 6.5.5
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
+PYTHON_TORNADO_SITE = $(call pypi,tornado)
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 48a7e84e6d..1cb49142b0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TORTOISE_ORM_VERSION = 1.1.7
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1d/55/e75d3ae0dd2c96cf961bf068f465fb62ec481d802beb65f406620bfd40a0
+PYTHON_TORTOISE_ORM_SITE = $(call pypi,tortoise_orm)
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
index 9a192fc7ca..97194f2002 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.mk
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TPM2_PYTSS_VERSION = 2.3.0
 PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
-PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520
+PYTHON_TPM2_PYTSS_SITE = $(call pypi,tpm2-pytss)
 PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
 PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
 PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index df455973f4..cd0a8ff0bd 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TQDM_VERSION = 4.67.3
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4
+PYTHON_TQDM_SITE = $(call pypi,tqdm)
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
diff --git a/package/python-trafaret/python-trafaret.mk b/package/python-trafaret/python-trafaret.mk
index 74d87a3d13..ac891e5464 100644
--- a/package/python-trafaret/python-trafaret.mk
+++ b/package/python-trafaret/python-trafaret.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TRAFARET_VERSION = 2.1.1
 PYTHON_TRAFARET_SOURCE = trafaret-$(PYTHON_TRAFARET_VERSION).tar.gz
-PYTHON_TRAFARET_SITE = https://files.pythonhosted.org/packages/c9/ed/aac034e566f8846aee6472dcc90da6011a0b1829e3ffc768407df519a3b0
+PYTHON_TRAFARET_SITE = $(call pypi,trafaret)
 PYTHON_TRAFARET_SETUP_TYPE = setuptools
 PYTHON_TRAFARET_LICENSE = BSD-2-Clause
 PYTHON_TRAFARET_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index f0f99e3dfb..126695a014 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TRAITLETS_VERSION = 5.14.3
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
+PYTHON_TRAITLETS_SITE = $(call pypi,traitlets)
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
 PYTHON_TRAITLETS_SETUP_TYPE = hatch
diff --git a/package/python-transitions/python-transitions.mk b/package/python-transitions/python-transitions.mk
index 8189cebcbd..3bee4400f9 100644
--- a/package/python-transitions/python-transitions.mk
+++ b/package/python-transitions/python-transitions.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TRANSITIONS_VERSION = 0.9.3
 PYTHON_TRANSITIONS_SOURCE = transitions-$(PYTHON_TRANSITIONS_VERSION).tar.gz
-PYTHON_TRANSITIONS_SITE = https://files.pythonhosted.org/packages/source/t/transitions
+PYTHON_TRANSITIONS_SITE = $(call pypi,transitions)
 PYTHON_TRANSITIONS_SETUP_TYPE = setuptools
 
 PYTHON_TRANSITIONS_LICENSE = MIT
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index a8e451731f..a37dc0ad23 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TREQ_VERSION = 25.5.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
+PYTHON_TREQ_SITE = $(call pypi,treq)
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = hatch
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
index f4a9304f15..43c1cc76c7 100644
--- a/package/python-trio-websocket/python-trio-websocket.mk
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TRIO_WEBSOCKET_VERSION = 0.12.2
 PYTHON_TRIO_WEBSOCKET_SOURCE = trio_websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
-PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d1/3c/8b4358e81f2f2cfe71b66a267f023a91db20a817b9425dd964873796980a
+PYTHON_TRIO_WEBSOCKET_SITE = $(call pypi,trio_websocket)
 PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
 PYTHON_TRIO_WEBSOCKET_LICENSE_FILES = LICENSE
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 4211dbb313..c908931c46 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TRIO_VERSION = 0.33.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f
+PYTHON_TRIO_SITE = $(call pypi,trio)
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 645f57af33..2f00aaf647 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.4.28.13
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/04/af/88fdebf242bc7bc4957c96c5358a2b2b0f07e5001401906783a521ea9f54
+PYTHON_TROVE_CLASSIFIERS_SITE = $(call pypi,trove_classifiers)
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8db5d3750c..e94c7d2857 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TWISTED_VERSION = 25.5.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
+PYTHON_TWISTED_SITE = $(call pypi,twisted)
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index cb29609254..fd6c95224b 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TXAIO_VERSION = 25.12.2
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/7f/67/ea9c9ddbaa3e0b4d53c91f8778a33e42045be352dc7200ed2b9aaa7dc229
+PYTHON_TXAIO_SITE = $(call pypi,txaio)
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = hatch
diff --git a/package/python-txdbus/python-txdbus.mk b/package/python-txdbus/python-txdbus.mk
index 4e4ddf03cb..82410b70e6 100644
--- a/package/python-txdbus/python-txdbus.mk
+++ b/package/python-txdbus/python-txdbus.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TXDBUS_VERSION = 1.1.2
 PYTHON_TXDBUS_SOURCE = txdbus-$(PYTHON_TXDBUS_VERSION).tar.gz
-PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/d6/ef/43377e975b8d37862fd1166a4998f908651f5e205ddc9bbd7a57c6e5b4b6
+PYTHON_TXDBUS_SITE = $(call pypi,txdbus)
 PYTHON_TXDBUS_SETUP_TYPE = setuptools
 PYTHON_TXDBUS_LICENSE = MIT
 
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 13a2454d6a..e69299f1aa 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TXTORCON_VERSION = 24.8.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b9/9f/7815b07d8bc775d9578d9131267bb7ce3e91e31305688736ed796ae724d1
+PYTHON_TXTORCON_SITE = $(call pypi,txtorcon)
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index cf07bf345b..dac523c47b 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPEGUARD_VERSION = 4.5.1
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/2b/e8/66e25efcc18542d58706ce4e50415710593721aae26e794ab1dec34fb66f
+PYTHON_TYPEGUARD_SITE = $(call pypi,typeguard)
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 03760f1d5f..96c8c79787 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPEPY_VERSION = 1.3.4
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/79/59/4c39942077d7de285f762a91024dbda731be693591732977358f77d120fb
+PYTHON_TYPEPY_SITE = $(call pypi,typepy)
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 4a596de1b1..de6beaf5b7 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260130
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/69/14/fc5fb0a6ddfadf68c27e254a02ececd4d5c7fdb0efcb7e7e917a183497fb
+PYTHON_TYPES_PSUTIL_SITE = $(call pypi,types_psutil)
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index cece2e4fb1..73c89fcb93 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260305
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1d/c7/025c624f347e10476b439a6619a95f1d200250ea88e7ccea6e09e48a7544
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = $(call pypi,types_python_dateutil)
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4759fae2cb..db09c157ef 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260210
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4b/90/796ac8c774a7f535084aacbaa6b7053d16fff5c630eff87c3ecff7896c37
+PYTHON_TYPES_SETUPTOOLS_SITE = $(call pypi,types_setuptools)
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index d181b973a5..d3eb8c5ba4 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
+PYTHON_TYPING_EXTENSIONS_SITE = $(call pypi,typing_extensions)
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
index 09930058b5..0c49de237b 100644
--- a/package/python-typing-inspect/python-typing-inspect.mk
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPING_INSPECT_VERSION = 0.9.0
 PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
-PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/dc/74/1789779d91f1961fa9438e9a8710cdae6bd138c80d7303996933d117264a
+PYTHON_TYPING_INSPECT_SITE = $(call pypi,typing_inspect)
 PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
 PYTHON_TYPING_INSPECT_LICENSE = MIT
 PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index c0af54056d..2533b40de5 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TYPING_INSPECTION_VERSION = 0.4.2
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655
+PYTHON_TYPING_INSPECTION_SITE = $(call pypi,typing_inspection)
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index 2c1e5ff87a..c12c5e305d 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TZLOCAL_VERSION = 5.3.1
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/8b/2e/c14812d3d4d9cd1773c6be938f89e5735a1f11a9f184ac3639b93cef35d5
+PYTHON_TZLOCAL_SITE = $(call pypi,tzlocal)
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index f4a11eb0b9..9f406c2550 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -6,7 +6,7 @@
 
 PYTHON_U_MSGPACK_VERSION = 2.8.0
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/36/9d/a40411a475e7d4838994b7f6bcc6bfca9acc5b119ce3a7503608c4428b49
+PYTHON_U_MSGPACK_SITE = $(call pypi,u-msgpack-python)
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index 93ab9dc139..32eeb1b72f 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UBJSON_VERSION = 0.16.1
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/1d/c7/28220d37e041fe1df03e857fe48f768dcd30cd151480bf6f00da8713214a
+PYTHON_UBJSON_SITE = $(call pypi,py-ubjson)
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
diff --git a/package/python-uhid/python-uhid.mk b/package/python-uhid/python-uhid.mk
index 215545b60f..5240efb3d6 100644
--- a/package/python-uhid/python-uhid.mk
+++ b/package/python-uhid/python-uhid.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UHID_VERSION = 0.0.1
 PYTHON_UHID_SOURCE = uhid-$(PYTHON_UHID_VERSION).tar.gz
-PYTHON_UHID_SITE = https://files.pythonhosted.org/packages/cb/44/6ebe9dceadc028507d16603e2bb542557a4c70c6032ef8ee507c3ce51283
+PYTHON_UHID_SITE = $(call pypi,uhid)
 PYTHON_UHID_SETUP_TYPE = setuptools
 PYTHON_UHID_LICENSE = MIT
 PYTHON_UHID_LICENSE_FILES = LICENSE
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 3893a205c8..b09160b9b8 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UJSON_VERSION = 5.12.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/cb/3e/c35530c5ffc25b71c59ae0cd7b8f99df37313daa162ce1e2f7925f7c2877
+PYTHON_UJSON_SITE = $(call pypi,ujson)
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
index 364099f707..7df43b7538 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UNITTEST_XML_REPORTING_VERSION = 4.0.0
 PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest_xml_reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
-PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/42/6b/5847d0e6e95d08e056f23b3f8cd95bede2d3ade10a1c1a9d5b50916454e1
+PYTHON_UNITTEST_XML_REPORTING_SITE = $(call pypi,unittest_xml_reporting)
 PYTHON_UNITTEST_XML_REPORTING_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
 PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7f7f0b03d2..ad10b5cdcc 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -6,7 +6,7 @@
 
 PYTHON_URLLIB3_VERSION = 2.6.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
+PYTHON_URLLIB3_SITE = $(call pypi,urllib3)
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
index edd49b82e0..932e59155a 100644
--- a/package/python-urwid-readline/python-urwid-readline.mk
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -6,7 +6,7 @@
 
 PYTHON_URWID_READLINE_VERSION = 0.15.1
 PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
-PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ad/70/be318554495555eba7d8ff6e489f6f74ddb225b24086ba4af62a82e723fd
+PYTHON_URWID_READLINE_SITE = $(call pypi,urwid_readline)
 PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
 PYTHON_URWID_READLINE_LICENSE = MIT
 PYTHON_URWID_READLINE_LICENSE_FILES = LICENSE.md LICENSE
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index b6622864a6..9f05f33862 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -6,7 +6,7 @@
 
 PYTHON_URWID_VERSION = 4.0.0
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/1c/09/afbd44c7c57b1124d94ffe6321154798b816bd09c00e0aaabb701583a1c8
+PYTHON_URWID_SITE = $(call pypi,urwid)
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index 3ba20ef476..8b95433867 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -6,7 +6,7 @@
 
 PYTHON_USWID_VERSION = 0.6.0
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5b/4b/4eb0e287c6587f55212e87eaf24d262d21d47a56d034dfae11649eff613f
+PYTHON_USWID_SITE = $(call pypi,uswid)
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 66bbcd7253..5728c24109 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UVICORN_VERSION = 0.46.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/1f/93/041fca8274050e40e6791f267d82e0e2e27dd165627bd640d3e0e378d877
+PYTHON_UVICORN_SITE = $(call pypi,uvicorn)
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 419ee33062..5dd0588df5 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UVLOOP_VERSION = 0.22.1
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
+PYTHON_UVLOOP_SITE = $(call pypi,uvloop)
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 3135b288ee..71fe80b316 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VALIDATORS_VERSION = 0.35.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/53/66/a435d9ae49850b2f071f7ebd8119dd4e84872b01630d6736761e6e7fd847
+PYTHON_VALIDATORS_SITE = $(call pypi,validators)
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-versioneer/python-versioneer.mk b/package/python-versioneer/python-versioneer.mk
index 5dbf0dd1c2..4afbb2b56f 100644
--- a/package/python-versioneer/python-versioneer.mk
+++ b/package/python-versioneer/python-versioneer.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VERSIONEER_VERSION = 0.29
 PYTHON_VERSIONEER_SOURCE = versioneer-$(PYTHON_VERSIONEER_VERSION).tar.gz
-PYTHON_VERSIONEER_SITE = https://files.pythonhosted.org/packages/32/d7/854e45d2b03e1a8ee2aa6429dd396d002ce71e5d88b77551b2fb249cb382
+PYTHON_VERSIONEER_SITE = $(call pypi,versioneer)
 PYTHON_VERSIONEER_SETUP_TYPE = setuptools
 PYTHON_VERSIONEER_LICENSE = Unlicense
 PYTHON_VERSIONEER_LICENSE_FILES = LICENSE
diff --git a/package/python-waitress/python-waitress.mk b/package/python-waitress/python-waitress.mk
index 660f839a4d..4d21c1365d 100644
--- a/package/python-waitress/python-waitress.mk
+++ b/package/python-waitress/python-waitress.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WAITRESS_VERSION = 3.0.2
 PYTHON_WAITRESS_SOURCE = waitress-$(PYTHON_WAITRESS_VERSION).tar.gz
-PYTHON_WAITRESS_SITE = https://files.pythonhosted.org/packages/bf/cb/04ddb054f45faa306a230769e868c28b8065ea196891f09004ebace5b184
+PYTHON_WAITRESS_SITE = $(call pypi,waitress)
 PYTHON_WAITRESS_SETUP_TYPE = setuptools
 PYTHON_WAITRESS_LICENSE = ZPL-2.1
 PYTHON_WAITRESS_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 888cce6e1a..740793ddbb 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WATCHDOG_VERSION = 6.0.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/db/7d/7f3d619e951c88ed75c6037b246ddcf2d322812ee8ea189be89511721d54
+PYTHON_WATCHDOG_SITE = $(call pypi,watchdog)
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 15b5f495e8..53738e9159 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WCWIDTH_VERSION = 0.2.14
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/24/30/6b0809f4510673dc723187aeaf24c7f5459922d01e2f794277a3dfb90345
+PYTHON_WCWIDTH_SITE = $(call pypi,wcwidth)
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index b36d96fd1d..862b616b8b 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEASYPRINT_VERSION = 68.1
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/db/3e/65c0f176e6fb5c2b0a1ac13185b366f727d9723541babfa7fa4309998169
+PYTHON_WEASYPRINT_SITE = $(call pypi,weasyprint)
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index f77eedcd21..d0430ece44 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEBARGS_VERSION = 8.7.1
 PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
-PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/37/64/17afc4e6f47eef154a553c6e56adcc9f1ac3003305c7df978d11aa62937e
+PYTHON_WEBARGS_SITE = $(call pypi,webargs)
 PYTHON_WEBARGS_SETUP_TYPE = flit
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
diff --git a/package/python-webencodings/python-webencodings.mk b/package/python-webencodings/python-webencodings.mk
index 63c6d37373..2a14055c23 100644
--- a/package/python-webencodings/python-webencodings.mk
+++ b/package/python-webencodings/python-webencodings.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEBENCODINGS_VERSION = 0.5.1
 PYTHON_WEBENCODINGS_SOURCE = webencodings-$(PYTHON_WEBENCODINGS_VERSION).tar.gz
-PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47
+PYTHON_WEBENCODINGS_SITE = $(call pypi,webencodings)
 PYTHON_WEBENCODINGS_SETUP_TYPE = setuptools
 PYTHON_WEBENCODINGS_LICENSE = BSD-3-Clause
 PYTHON_WEBENCODINGS_LICENSE_FILES = PKG-INFO
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 1e58d590d1..a4d4a7ca6a 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEBOB_VERSION = 1.8.9
 PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/85/0b/1732085540b01f65e4e7999e15864fe14cd18b12a95731a43fd6fd11b26a
+PYTHON_WEBOB_SITE = $(call pypi,webob)
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index f735782cf8..187b6cb107 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1
+PYTHON_WEBSOCKET_CLIENT_SITE = $(call pypi,websocket_client)
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index b7b8d26e2b..b5d3ffbdd4 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WEBSOCKETS_VERSION = 16.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4
+PYTHON_WEBSOCKETS_SITE = $(call pypi,websockets)
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 745e93f443..2546bb98fe 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WERKZEUG_VERSION = 3.1.8
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/dd/b2/381be8cfdee792dd117872481b6e378f85c957dd7c5bca38897b08f765fd
+PYTHON_WERKZEUG_SITE = $(call pypi,werkzeug)
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index ae379b7ed6..06047967c2 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WHEEL_VERSION = 0.47.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/39/62/75f18a0f03b4219c456652c7780e4d749b929eb605c098ce3a5b6b6bc081
+PYTHON_WHEEL_SITE = $(call pypi,wheel)
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
index 6a11c1db3e..23975c9327 100644
--- a/package/python-whitenoise/python-whitenoise.mk
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WHITENOISE_VERSION = 6.12.0
 PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
-PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/cb/2a/55b3f3a4ec326cd077c1c3defeee656b9298372a69229134d930151acd01
+PYTHON_WHITENOISE_SITE = $(call pypi,whitenoise)
 PYTHON_WHITENOISE_SETUP_TYPE = setuptools
 PYTHON_WHITENOISE_LICENSE = MIT
 PYTHON_WHITENOISE_LICENSE_FILES = LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 86454371b2..e315cd5442 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WRAPT_VERSION = 2.0.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/2a/6de8a50cb435b7f42c46126cf1a54b2aab81784e74c8595c8e025e8f36d3
+PYTHON_WRAPT_SITE = $(call pypi,wrapt)
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index c76c636d8b..96fba55517 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WS4PY_VERSION = 0.6.0
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/cb/55/dd8a5e1f975d1549494fe8692fc272602f17e475fe70de910cdd53aec902
+PYTHON_WS4PY_SITE = $(call pypi,ws4py)
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3-Clause
 PYTHON_WS4PY_LICENSE_FILES = LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 0f942bb5e4..4e1d3cf3fc 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WSACCEL_VERSION = 0.6.7
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/8b/06/e8f0450952ed1fb4aa2033a30ae5afb59632f5a35d441bcc6801a3aaca47
+PYTHON_WSACCEL_SITE = $(call pypi,wsaccel)
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
index e16f72f6e0..7c6a6cb5e7 100644
--- a/package/python-wsproto/python-wsproto.mk
+++ b/package/python-wsproto/python-wsproto.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WSPROTO_VERSION = 1.3.2
 PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
-PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c7/79/12135bdf8b9c9367b8701c2c19a14c913c120b882d50b014ca0d38083c2c
+PYTHON_WSPROTO_SITE = $(call pypi,wsproto)
 PYTHON_WSPROTO_SETUP_TYPE = setuptools
 PYTHON_WSPROTO_LICENSE = MIT
 PYTHON_WSPROTO_LICENSE_FILES = LICENSE
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 69e051f150..76add65f79 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WTFORMS_VERSION = 3.2.1
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/01/e4/633d080897e769ed5712dcfad626e55dbd6cf45db0ff4d9884315c6a82da
+PYTHON_WTFORMS_SITE = $(call pypi,wtforms)
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 23c7b39974..b17a7c1543 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_XLIB_VERSION = 0.33
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/86/f5/8c0653e5bb54e0cbdfe27bf32d41f27bc4e12faa8742778c17f2a71be2c0
+PYTHON_XLIB_SITE = $(call pypi,python-xlib)
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index b7a1420de3..96136310d1 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XLRD_VERSION = 2.0.2
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/07/5a/377161c2d3538d1990d7af382c79f3b2372e880b65de21b01b1a2b78691e
+PYTHON_XLRD_SITE = $(call pypi,xlrd)
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = LICENSE
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index e6a8fe4adf..a4632959da 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XLSXWRITER_VERSION = 3.2.9
 PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/46/2c/c06ef49dc36e7954e55b802a8b231770d286a9758b3d936bd1e04ce5ba88
+PYTHON_XLSXWRITER_SITE = $(call pypi,xlsxwriter)
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
index aaeeffc501..881729039c 100644
--- a/package/python-xlwt/python-xlwt.mk
+++ b/package/python-xlwt/python-xlwt.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XLWT_VERSION = 1.3.0
 PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
-PYTHON_XLWT_SITE = https://files.pythonhosted.org/packages/06/97/56a6f56ce44578a69343449aa5a0d98eefe04085d69da539f3034e2cd5c1
+PYTHON_XLWT_SITE = $(call pypi,xlwt)
 PYTHON_XLWT_SETUP_TYPE = setuptools
 PYTHON_XLWT_LICENSE = BSD-3-Clause, BSD-4-Clause
 PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
diff --git a/package/python-xmljson/python-xmljson.mk b/package/python-xmljson/python-xmljson.mk
index 913dce2670..8a0c8c36ac 100644
--- a/package/python-xmljson/python-xmljson.mk
+++ b/package/python-xmljson/python-xmljson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XMLJSON_VERSION = 0.2.1
 PYTHON_XMLJSON_SOURCE = xmljson-$(PYTHON_XMLJSON_VERSION).tar.gz
-PYTHON_XMLJSON_SITE = https://files.pythonhosted.org/packages/e8/6f/d9f109ba19be510fd3098bcb72143c67ca6743cedb48ac75aef05ddfe960
+PYTHON_XMLJSON_SITE = $(call pypi,xmljson)
 PYTHON_XMLJSON_SETUP_TYPE = setuptools
 PYTHON_XMLJSON_LICENSE = MIT
 PYTHON_XMLJSON_LICENSE_FILES = LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 583996459e..4449c09a3a 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XMLTODICT_VERSION = 1.0.4
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/19/70/80f3b7c10d2630aa66414bf23d210386700aa390547278c789afa994fd7e
+PYTHON_XMLTODICT_SITE = $(call pypi,xmltodict)
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index b9e48d2c39..1320a5f753 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -6,7 +6,7 @@
 
 PYTHON_XMODEM_VERSION = 0.5.0
 PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
-PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/c7/03/a18c2b571266787aebb7cadc5d4c90af15ae7e949ae0ee99ed23b5ba4f3c
+PYTHON_XMODEM_SITE = $(call pypi,xmodem)
 PYTHON_XMODEM_SETUP_TYPE = setuptools
 PYTHON_XMODEM_LICENSE = MIT
 PYTHON_XMODEM_LICENSE_FILES = LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index 9b79d1766f..66aef04f6c 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -6,7 +6,7 @@
 
 PYTHON_YAMLLINT_VERSION = 1.38.0
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
-PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/28/a0/8fc2d68e132cf918f18273fdc8a1b8432b60d75ac12fdae4b0ef5c9d2e8d
+PYTHON_YAMLLINT_SITE = $(call pypi,yamllint)
 PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index d04713e569..c0ecafda03 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_YARL_VERSION = 1.23.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/6e/beb1beec874a72f23815c1434518bfc4ed2175065173fb138c3705f658d4
+PYTHON_YARL_SITE = $(call pypi,yarl)
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index aaafef8988..d763396b11 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_YATL_VERSION = 20230507.3
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/bd/3b/723a667a24512a299e1e139608e787c3b24b7819302c15c7aac09c3bec68
+PYTHON_YATL_SITE = $(call pypi,yatl)
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 PYTHON_YATL_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
index b060e537f4..53ac96669e 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.mk
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZC_LOCKFILE_VERSION = 4.0
 PYTHON_ZC_LOCKFILE_SOURCE = zc_lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
-PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/10/9a/2fef89272d98b799e4daa50201c5582ec76bdd4e92a1a7e3deb74c52b7fa
+PYTHON_ZC_LOCKFILE_SITE = $(call pypi,zc_lockfile)
 PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
 PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index fe7676e2ee..94ff09fbf8 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZEROCONF_VERSION = 0.148.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/67/46/10db987799629d01930176ae523f70879b63577060d63e05ebf9214aba4b
+PYTHON_ZEROCONF_SITE = $(call pypi,zeroconf)
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 35e03d041b..b0ca58e5cc 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZIPSTREAM_NG_VERSION = 1.9.0
 PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/11/f2/690a35762cf8366ce6f3b644805de970bd6a897ca44ce74184c7b2bc94e7
+PYTHON_ZIPSTREAM_NG_SITE = $(call pypi,zipstream_ng)
 PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index 70538ce63c..dcfa63b887 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZLMDB_VERSION = 23.1.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/56/b2/abaeb5419435a6224a0beb2b5edad621ec975fe4802297963ecf1728b883
+PYTHON_ZLMDB_SITE = $(call pypi,zlmdb)
 PYTHON_ZLMDB_SETUP_TYPE = setuptools
 PYTHON_ZLMDB_LICENSE = MIT
 PYTHON_ZLMDB_LICENSE_FILES = LICENSE
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 1f2535324a..20fabb334d 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZOPE_INTERFACE_VERSION = 8.4
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/9f/65/34a6e6e4dfa260c4c55ee02bb2fc53625e126ff0181485286cf0c9d453d6
+PYTHON_ZOPE_INTERFACE_SITE = $(call pypi,zope_interface)
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index e914e1dae9..f7fdd0cbe5 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZOPFLI_VERSION = 0.4.1
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072
+PYTHON_ZOPFLI_SITE = $(call pypi,zopfli)
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index f1f76f38a6..208024763f 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SCONS_VERSION = 4.8.1
-SCONS_SITE = https://files.pythonhosted.org/packages/b9/76/a2c1293642f9a448f2d012cabf525be69ca5abf4af289bc0935ac1554ee8
+SCONS_SITE = $(call pypi,scons)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
diff --git a/package/snmpclitools/snmpclitools.mk b/package/snmpclitools/snmpclitools.mk
index a4a90e5bf1..50b9ce2f3f 100644
--- a/package/snmpclitools/snmpclitools.mk
+++ b/package/snmpclitools/snmpclitools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SNMPCLITOOLS_VERSION = 0.6.4
-SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
+SNMPCLITOOLS_SITE = $(call pypi,snmpclitools)
 SNMPCLITOOLS_SETUP_TYPE = setuptools
 SNMPCLITOOLS_LICENSE = BSD-2-Clause
 SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index eb2a4990b7..fd500e9038 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUPERVISOR_VERSION = 4.2.5
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/ce/37/517989b05849dd6eaa76c148f24517544704895830a50289cbbf53c7efb9
+SUPERVISOR_SITE = $(call pypi,supervisor)
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
