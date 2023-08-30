Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01120C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CEF0417EB;
	Wed, 30 Aug 2023 20:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CEF0417EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7i_D_3NM-yI; Wed, 30 Aug 2023 20:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FE79417F9;
	Wed, 30 Aug 2023 20:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE79417F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB0C1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7AAE82F87
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7AAE82F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTCqKfWz9NBT for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:46:17 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4738F82F4A
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4738F82F4A
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b962535808so4466001fa.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693428375; x=1694033175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E1EKWZ14xSl0mEmOrti6FFJKbCKyQntuc9bD9G34Awo=;
 b=Pw3RTI1RUTPyqts4FLX3MR6IjFGaOiIlsgiu0hIsnkbeuX8YexS5Wtf3CTQuTbTkyO
 2lfoVgkiFgdTyCEfjBniTT2ZFlmel+5YU8+CeW49xho/bEoccjRv0Tu7tx8H83gwbP3w
 BbDsgIjfL3VNHb1YH6Bjv8gvzmrfvh74kXyTiF/HV4jEY88ZW1otmkXr2YRm0gXJdm/q
 OkqLgf2uC9WXoxmhlV9bdiLPWr+e+vfUdpkdzmy9ecemVLVic8CgCqDDj/E/CtxcUcfS
 lZGgsGIYYcjB+n7WoAKic6UmdFUJfGsU/qvf1OaTipxcK6Wx1Fy2gsvBnf+Em6LJCYj8
 Zxyw==
X-Gm-Message-State: AOJu0YzNtpqflc2EEjwglwUKRD0ysU1feZuX7X3T9Ymd21XXdLU31dh5
 wni7C1wmKB9brT2VxR7pblBFhA==
X-Google-Smtp-Source: AGHT+IHBRy0TmdCVg8RqhNgeP3RRps9ZKHcqpHZuoM3lNnrGBl9KpJ6D54/IYXiPjdoUQgnJaRkLVQ==
X-Received: by 2002:a2e:8908:0:b0:2bc:e51e:b007 with SMTP id
 d8-20020a2e8908000000b002bce51eb007mr2828498lji.41.1693428375111; 
 Wed, 30 Aug 2023 13:46:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 x27-20020a170906711b00b009930c80b87csm7674596ejj.142.2023.08.30.13.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:46:14 -0700 (PDT)
Message-ID: <4d3a19f4-e3cb-0438-479a-d2f00eb6ded8@mind.be>
Date: Wed, 30 Aug 2023 22:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-4-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-4-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693428375; x=1694033175; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E1EKWZ14xSl0mEmOrti6FFJKbCKyQntuc9bD9G34Awo=;
 b=MofcZaF5Xa3X39+c38nEmzSqJH6GLPC0iCUaejWhR7WPIAEgY+D+hanXtLv9z/Cxkz
 ILL1y5VCuBUAWe4doyFqLKZMHulzo/fSo0CulKTp1OqumyiIdIpKyY1sbBtVPKD1BMSL
 4YFEnd0sb95HlZ6hxdZky6rPaLOs+B/H3tcbGuhEVR3AHf4ue4sWe+hTvYIZ/WapkSxE
 gtn4uOfQE7FEZF5RxHniCHk/AGjUomF9aEZjbEwGvXMXFBAIgZsdqBNXKM45HRJ38Z1u
 GD7fcj5unRwUR2CXJ0DhOjWMghtsvVKQ5bZ8qoIEH/3M9WHD7g7qShFu3mtABGxccwB5
 MY+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MofcZaF5
Subject: Re: [Buildroot] [PATCH v3 4/8] support/scripts/gen-missing-cpe:
 remove rarely used script
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2023 21:28, Daniel Lang wrote:
> As discussed on the mailing list [0] keeping up with version numbers of
> all registered CPE ID won't work.
> In addition the feed used to generated the XML files will be retired
> [1]. In the future an API needs to be used for fetching the data in
> connection with a local database.
> All of this works against keeping this script and porting it to the new
> API.
> As a last blow Matthew, the original author concluded [2]:
> Makes sense to drop it.  There never got to be enough momentum in the overall
> software community to make CVE or even the new identifier really accurate.

  I have extended the commit log a bit to repeat a summary of the reasons for 
the removal, and also to explain a bit what the patch does.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> [0]: https://lists.buildroot.org/pipermail/buildroot/2023-August/672620.html
> [1]: https://nvd.nist.gov/General/News/change-timeline
> [2]: https://lists.buildroot.org/pipermail/buildroot/2023-August/672651.html
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
> v2 -> v3:
> - added this patch after feedback from Thomas
> ---
>   Makefile                        |   9 --
>   support/scripts/cpedb.py        | 174 --------------------------------
>   support/scripts/gen-missing-cpe |  65 ------------
>   support/scripts/pkg-stats       |   2 +-
>   4 files changed, 1 insertion(+), 249 deletions(-)
>   delete mode 100644 support/scripts/cpedb.py
>   delete mode 100755 support/scripts/gen-missing-cpe
> 
> diff --git a/Makefile b/Makefile
> index 080136bc9a..fd807cc3cc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,14 +927,6 @@ pkg-stats:
>   		--html $(O)/pkg-stats.html \
>   		--nvd-path $(DL_DIR)/buildroot-nvd
>   
> -.PHONY: missing-cpe
> -missing-cpe:
> -	$(Q)mkdir -p $(CPE_UPDATES_DIR)
> -	$(Q)cd "$(CONFIG_DIR)" ; \
> -	$(TOPDIR)/support/scripts/gen-missing-cpe \
> -		--nvd-path $(DL_DIR)/buildroot-nvd \
> -		--output $(CPE_UPDATES_DIR)
> -
>   else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>   
>   # Some subdirectories are also package names. To avoid that "make linux"
> @@ -1191,7 +1183,6 @@ help:
>   	@echo '  legal-info             - generate info about license compliance'
>   	@echo '  show-info              - generate info about packages, as a JSON blurb'
>   	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
> -	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
>   	@echo '  printvars              - dump internal variables selected with VARS=...'
>   	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
>   	@echo '                           to limit the list to variables names matching that pattern'
> diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
> deleted file mode 100644
> index f4daf56124..0000000000
> --- a/support/scripts/cpedb.py
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -#!/usr/bin/env python3
> -
> -import xml.etree.ElementTree as ET
> -from xml.etree.ElementTree import Element, SubElement
> -import gzip
> -import os
> -import requests
> -import time
> -from xml.dom import minidom
> -
> -VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
> -
> -CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
> -
> -ns = {
> -    '': 'http://cpe.mitre.org/dictionary/2.0',
> -    'cpe-23': 'http://scap.nist.gov/schema/cpe-extension/2.3',
> -    'xml': 'http://www.w3.org/XML/1998/namespace'
> -}
> -
> -
> -class CPE:
> -    def __init__(self, cpe_str, titles, refs):
> -        self.cpe_str = cpe_str
> -        self.titles = titles
> -        self.references = refs
> -        self.cpe_cur_ver = "".join(self.cpe_str.split(":")[5:6])
> -
> -    def update_xml_dict(self):
> -        ET.register_namespace('', 'http://cpe.mitre.org/dictionary/2.0')
> -        cpes = Element('cpe-list')
> -        cpes.set('xmlns:cpe-23', "http://scap.nist.gov/schema/cpe-extension/2.3")
> -        cpes.set('xmlns:ns6', "http://scap.nist.gov/schema/scap-core/0.1")
> -        cpes.set('xmlns:scap-core', "http://scap.nist.gov/schema/scap-core/0.3")
> -        cpes.set('xmlns:config', "http://scap.nist.gov/schema/configuration/0.1")
> -        cpes.set('xmlns:xsi', "http://www.w3.org/2001/XMLSchema-instance")
> -        cpes.set('xmlns:meta', "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2")
> -        cpes.set('xsi:schemaLocation', " ".join(["http://scap.nist.gov/schema/cpe-extension/2.3",
> -                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd",
> -                                                 "http://cpe.mitre.org/dictionary/2.0",
> -                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd",
> -                                                 "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
> -                                                 "https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd",
> -                                                 "http://scap.nist.gov/schema/scap-core/0.3",
> -                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd",
> -                                                 "http://scap.nist.gov/schema/configuration/0.1",
> -                                                 "https://scap.nist.gov/schema/nvd/configuration_0.1.xsd",
> -                                                 "http://scap.nist.gov/schema/scap-core/0.1",
> -                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"]))
> -        item = SubElement(cpes, 'cpe-item')
> -        cpe_short_name = CPE.short_name(self.cpe_str)
> -        cpe_new_ver = CPE.version_update(self.cpe_str)
> -
> -        item.set('name', 'cpe:/' + cpe_short_name)
> -        self.titles[0].text.replace(self.cpe_cur_ver, cpe_new_ver)
> -        for title in self.titles:
> -            item.append(title)
> -        if self.references:
> -            item.append(self.references)
> -        cpe23item = SubElement(item, 'cpe-23:cpe23-item')
> -        cpe23item.set('name', self.cpe_str)
> -
> -        # Generate the XML as a string
> -        xmlstr = ET.tostring(cpes)
> -
> -        # And use minidom to pretty print the XML
> -        return minidom.parseString(xmlstr).toprettyxml(encoding="utf-8").decode("utf-8")
> -
> -    @staticmethod
> -    def version(cpe):
> -        return cpe.split(":")[5]
> -
> -    @staticmethod
> -    def product(cpe):
> -        return cpe.split(":")[4]
> -
> -    @staticmethod
> -    def short_name(cpe):
> -        return ":".join(cpe.split(":")[2:6])
> -
> -    @staticmethod
> -    def version_update(cpe):
> -        return ":".join(cpe.split(":")[5:6])
> -
> -    @staticmethod
> -    def no_version(cpe):
> -        return ":".join(cpe.split(":")[:5])
> -
> -
> -class CPEDB:
> -    def __init__(self, nvd_path):
> -        self.all_cpes = dict()
> -        self.all_cpes_no_version = dict()
> -        self.nvd_path = nvd_path
> -
> -    def get_xml_dict(self):
> -        print("CPE: Setting up NIST dictionary")
> -        if not os.path.exists(os.path.join(self.nvd_path, "cpe")):
> -            os.makedirs(os.path.join(self.nvd_path, "cpe"))
> -
> -        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(CPEDB_URL))
> -        if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
> -            print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
> -            cpe_dict = requests.get(CPEDB_URL)
> -            open(cpe_dict_local, "wb").write(cpe_dict.content)
> -
> -        print("CPE: Unzipping xml manifest...")
> -        nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
> -        print("CPE: Converting xml manifest to dict...")
> -        tree = ET.parse(nist_cpe_file)
> -        all_cpedb = tree.getroot()
> -        self.parse_dict(all_cpedb)
> -
> -    def parse_dict(self, all_cpedb):
> -        # Cycle through the dict and build two dict to be used for custom
> -        # lookups of partial and complete CPE objects
> -        # The objects are then used to create new proposed XML updates if
> -        # if is determined one is required
> -        # Out of the different language titles, select English
> -        for cpe in all_cpedb.findall(".//{http://cpe.mitre.org/dictionary/2.0}cpe-item"):
> -            cpe_titles = []
> -            for title in cpe.findall('.//{http://cpe.mitre.org/dictionary/2.0}title[@xml:lang="en-US"]', ns):
> -                title.tail = None
> -                cpe_titles.append(title)
> -
> -            # Some older CPE don't include references, if they do, make
> -            # sure we handle the case of one ref needing to be packed
> -            # in a list
> -            cpe_ref = cpe.find(".//{http://cpe.mitre.org/dictionary/2.0}references")
> -            if cpe_ref:
> -                for ref in cpe_ref.findall(".//{http://cpe.mitre.org/dictionary/2.0}reference"):
> -                    ref.tail = None
> -                    ref.text = ref.text.upper()
> -                    if ref.text not in VALID_REFS:
> -                        ref.text = ref.text + "-- UPDATE this entry, here are some examples and just one word should be used -- " + ' '.join(VALID_REFS) # noqa E501
> -                cpe_ref.tail = None
> -                cpe_ref.text = None
> -
> -            cpe_str = cpe.find(".//{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item").get('name')
> -            item = CPE(cpe_str, cpe_titles, cpe_ref)
> -            cpe_str_no_version = CPE.no_version(cpe_str)
> -            # This dict must have a unique key for every CPE version
> -            # which allows matching to the specific obj data of that
> -            # NIST dict entry
> -            self.all_cpes.update({cpe_str: item})
> -            # This dict has one entry for every CPE (w/o version) to allow
> -            # partial match (no valid version) check (the obj is saved and
> -            # used as seed for suggested xml updates. By updating the same
> -            # non-version'd entry, it assumes the last update here is the
> -            # latest version in the NIST dict)
> -            self.all_cpes_no_version.update({cpe_str_no_version: item})
> -
> -    def find_partial(self, cpe_str):
> -        cpe_str_no_version = CPE.no_version(cpe_str)
> -        if cpe_str_no_version in self.all_cpes_no_version:
> -            return cpe_str_no_version
> -
> -    def find_partial_obj(self, cpe_str):
> -        cpe_str_no_version = CPE.no_version(cpe_str)
> -        if cpe_str_no_version in self.all_cpes_no_version:
> -            return self.all_cpes_no_version[cpe_str_no_version]
> -
> -    def find_partial_latest_version(self, cpe_str_partial):
> -        cpe_obj = self.find_partial_obj(cpe_str_partial)
> -        return cpe_obj.cpe_cur_ver
> -
> -    def find(self, cpe_str):
> -        if self.find_partial(cpe_str):
> -            if cpe_str in self.all_cpes:
> -                return cpe_str
> -
> -    def gen_update_xml(self, cpe_str):
> -        cpe = self.find_partial_obj(cpe_str)
> -        return cpe.update_xml_dict()
> diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
> deleted file mode 100755
> index 0b222f2659..0000000000
> --- a/support/scripts/gen-missing-cpe
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -#!/usr/bin/env python3
> -
> -import argparse
> -import sys
> -import json
> -import subprocess
> -import os
> -from cpedb import CPEDB, CPE
> -
> -
> -def gen_update_xml_reports(cpeids, cpedb, output):
> -    cpe_need_update = []
> -
> -    for cpe in cpeids:
> -        result = cpedb.find(cpe)
> -        if not result:
> -            result = cpedb.find_partial(CPE.no_version(cpe))
> -            if result:
> -                cpe_need_update.append(cpe)
> -            else:
> -                print("WARNING: no match found for '%s'" % cpe)
> -
> -    for cpe in cpe_need_update:
> -        xml = cpedb.gen_update_xml(cpe)
> -        fname = CPE.product(cpe) + '-' + CPE.version(cpe) + '.xml'
> -        print("Generating %s" % fname)
> -        with open(os.path.join(output, fname), 'w+') as fp:
> -            fp.write(xml)
> -
> -    print("Generated %d update files out of %d CPEs" % (len(cpe_need_update), len(cpeids)))
> -
> -
> -def get_cpe_ids():
> -    print("Getting list of CPE for enabled packages")
> -    cmd = ["make", "--no-print-directory", "show-info"]
> -    js = json.loads(subprocess.check_output(cmd).decode("utf-8"))
> -    return set([v["cpe-id"] for k, v in js.items() if "cpe-id" in v])
> -
> -
> -def resolvepath(path):
> -    return os.path.abspath(os.path.expanduser(path))
> -
> -
> -def parse_args():
> -    parser = argparse.ArgumentParser()
> -    parser.add_argument('--output', dest='output',
> -                        help='Path to the output CPE update files', type=resolvepath, required=True)
> -    parser.add_argument('--nvd-path', dest='nvd_path',
> -                        help='Path to the local NVD database', type=resolvepath, required=True)
> -    return parser.parse_args()
> -
> -
> -def __main__():
> -    args = parse_args()
> -    if not os.path.isdir(args.output):
> -        print("ERROR: output directory %s does not exist" % args.output)
> -        sys.exit(1)
> -    cpedb = CPEDB(args.nvd_path)
> -    cpedb.get_xml_dict()
> -    cpeids = get_cpe_ids()
> -    gen_update_xml_reports(cpeids, cpedb, args.output)
> -
> -
> -if __name__ == "__main__":
> -    __main__()
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index c124b8a9cf..3cb9da6a0b 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -37,10 +37,10 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
>   
>   sys.path.append(os.path.join(brpath, "utils"))
>   from getdeveloperlib import parse_developers  # noqa: E402
> -from cpedb import CPEDB_URL  # noqa: E402
>   
>   INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
>   URL_RE = re.compile(r"\s*https?://\S*\s*$")
> +CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
>   
>   RM_API_STATUS_ERROR = 1
>   RM_API_STATUS_FOUND_BY_DISTRO = 2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
