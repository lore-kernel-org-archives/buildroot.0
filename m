Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1592C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FCC941987;
	Mon, 25 Jul 2022 16:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FCC941987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFP0irXQlktX; Mon, 25 Jul 2022 16:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9936141A04;
	Mon, 25 Jul 2022 16:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9936141A04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4B71BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451DB41A04
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451DB41A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkv-RZyK-WeW for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 16:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DC841987
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58DC841987
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 16:56:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso4040800wma.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P0HYCd0rUf99mRO65jqKjShzOhtAoxUCWlGr8KKqZHw=;
 b=dPsD8IU/xyu+/tjJjo+hzLgJhxAEH6y2ft7p0KXOsXdU39JINhCnANzCnjtUT3rhYV
 YPI94Kvx1YcUY+rZ4smnLIBXWZCw9gbNI9Sg9oGQLNOcOFo1TyNicnCKkD2ZH4IgsbBo
 N6j3SIul0TOD7HNF9aya8wg0bmCxHGkNf2m81eYZb9gcdqoWNKLg7Vz6r8EoY/tg1Aci
 9zrP2rJli/bXYQKS2g/iMoorg/hlyV+tfnfDPlM7yqDd+5gCnyEYkcVkbSgRVbn+O0Ho
 3gsSTXEuSPkQ/whQLX94nGsj37zvTpQivlkEFoBmbWniTeQ4GWhBMoDtdZVuU0CcI/Ob
 JQQA==
X-Gm-Message-State: AJIora/dPjZfwtWU6Gyqqcek+sEpe+U4sfAfaysGE1QLWb6N+kj3R04b
 FPQndIqnuK4QEC+gpzkYOmSyuBOQRKFgUw==
X-Google-Smtp-Source: AGRyM1vCbmvBxYslu/H4sBoOor9YHkY0Do9WvikM89G+uUerfo7S+UyLWu89pIkOcbcbXnWbPeu3CQ==
X-Received: by 2002:a05:600c:1e0f:b0:3a3:191c:a3c8 with SMTP id
 ay15-20020a05600c1e0f00b003a3191ca3c8mr9481509wmb.151.1658768182307; 
 Mon, 25 Jul 2022 09:56:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600011cd00b0021d6924b777sm12201579wrx.115.2022.07.25.09.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 09:56:21 -0700 (PDT)
Message-ID: <670ac6db-ccaa-78ec-a86a-386bd774206e@mind.be>
Date: Mon, 25 Jul 2022 18:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ankur Tyagi <ankur.tyagi@gallagher.com>, buildroot@buildroot.org
References: <20210928203547.863-1-ankur.tyagi@gallagher.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928203547.863-1-ankur.tyagi@gallagher.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=P0HYCd0rUf99mRO65jqKjShzOhtAoxUCWlGr8KKqZHw=;
 b=Fensc7Y87U2bt7kf4f0CFGOymM3qB7tpnYs9depTR3VrXpA4qlH6n3pfasTh+nlDvS
 UqFsl6HxGf2dlgl7qRMEZJ3ULjAB76VMA5EnKfIc1PYy/CgcaDT0eCACnRSAYtQSnoxn
 6u6GsRAbcUCAHHB5uUU1oSoqrQBj4cW0CSsjFypinIEjD3Va+yXucw7wZnkDYLIrE/M7
 2Z2/pBZ+BvWHhWykjZqowG7k6Xww1NlaSt2JOeZ2QnSVT9AtSpj8He2r1gsVTQJFY0zQ
 gifNJsDro5Xu7c//OGqMJRP4T0rrTKtRrQq0aZaFoOoXMfqlYU3e+hyAMSBqiCrBOCD4
 RYQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fensc7Y8
Subject: Re: [Buildroot] [PATCH 1/1] core: add option to override CPE and
 NVD base url
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/09/2021 22:35, Ankur Tyagi wrote:
> It may be desirable to integrate "pkg-stats" as part of build pipeline
> and usually build machines don't have internet access.
> In those scenarios, private network can be used to fetch CPE dictionary
> and NVD data (which are a pre-downloaded artifact).

  I completely understand the use case.


> This commit introduces config options BR2_CPEDB_BASE_URL and
> BR2_NVD_BASE_URL which can point to those internal/private network url.

  However, I think this unnecessarily complicates how to use it. Normally you 
can just copy download dir from a build which does have internet access and use 
that in your CI builds. With these additional URLs, you have to find out 
yourself exactly which URLs need to be downloaded from NIST, and in which exact 
location (directory structure) to put them.

  A much simpler approach (from a user perspective) is to leverage the already 
existing BR2_PRIMARY_SITE (and BR2_PRIMARY_SITE_ONLY) to implement this.

> By default, they refer to NIST official url.
> 
> It also adds CPE and NVD base url arguments to pkg-stats which
> are then passed to CVE and CPE class methods to fetch CPE dictionary
> and NVD data.
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
[snip]
> diff --git a/Makefile b/Makefile
> index c960b53a6d..acb2c76aea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -930,7 +930,9 @@ pkg-stats:
>   	$(TOPDIR)/support/scripts/pkg-stats -c \
>   		--json $(O)/pkg-stats.json \
>   		--html $(O)/pkg-stats.html \
> -		--nvd-path $(DL_DIR)/buildroot-nvd
> +		--nvd-path $(DL_DIR)/buildroot-nvd \
> +		--cpedb-base-url $(BR2_CPEDB_BASE_URL) \
> +		--nvd-base-url $(BR2_NVD_BASE_URL)

  Here basically you'd add something like

		$(if $(BR2_PRIMARY_SITE),--primary-site $(BR2_PRIMARY_SITE)) \
		$(if $(BR2_PRIMARY_SITE_ONLY),--primary-site-only)

>   .PHONY: missing-cpe
>   missing-cpe:
> diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
> index f4daf56124..36846621c3 100644
> --- a/support/scripts/cpedb.py
> +++ b/support/scripts/cpedb.py
> @@ -10,7 +10,7 @@ from xml.dom import minidom
>   
>   VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
>   
> -CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
> +CPE_DICTIONARY = "official-cpe-dictionary_v2.3.xml.gz"
>   
>   ns = {
>       '': 'http://cpe.mitre.org/dictionary/2.0',
> @@ -88,20 +88,22 @@ class CPE:
>   
>   
>   class CPEDB:
> -    def __init__(self, nvd_path):
> +    def __init__(self, nvd_path, cpedb_base_url):
>           self.all_cpes = dict()
>           self.all_cpes_no_version = dict()
>           self.nvd_path = nvd_path
> +        self.cpedb_base_url = cpedb_base_url
>   
>       def get_xml_dict(self):
>           print("CPE: Setting up NIST dictionary")
>           if not os.path.exists(os.path.join(self.nvd_path, "cpe")):
>               os.makedirs(os.path.join(self.nvd_path, "cpe"))
>   
> -        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(CPEDB_URL))
> +        url = "%s/%s" % (self.cpedb_base_url, CPE_DICTIONARY)

  Here, you do need to construct the URL differently if BR2_PRIMARY_SITE is 
used, since it will be under <BR2_PRIMARY_SITE>/buildroot-nvd/<CPE_DICTIONARY>.

  In general, you'd also want to use the backup mechanism, i.e. if it's not 
found on BR2_PRIMARY_SITE, then it's downloaded directly from NIST (unless 
primary-only is set). That makes it easy to populate it without having to change 
the .config.

  It may be easier to implement that by calling into the download helper 
support/download/dl-wrapper. This already has also the infrastructure to handle 
multiple URLs to try, and to avoid download if the file is already there. It 
also supports URLs with file:// and scp:// in addition to http(s)://, which may 
be useful for some users.


  For now, I've marked the patch as Changes Requested in patchwork. Sorry that 
it took so long before anyone looked at it. Somewhat complicated things that add 
fringe features tend to have that effect.


  Regards,
  Arnout


> +        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(url))
>           if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
> -            print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
> -            cpe_dict = requests.get(CPEDB_URL)
> +            print("CPE: Fetching xml manifest from [" + url + "]")
> +            cpe_dict = requests.get(url)
>               open(cpe_dict_local, "wb").write(cpe_dict.content)
>   
>           print("CPE: Unzipping xml manifest...")
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index 13c29fabe0..0ff5fbe823 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -42,7 +42,6 @@ sys.path.append('utils/')
>   
>   NVD_START_YEAR = 2002
>   NVD_JSON_VERSION = "1.1"
> -NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
>   
>   ops = {
>       '>=': operator.ge,
> @@ -82,7 +81,7 @@ class CVE:
>           self.nvd_cve = nvd_cve
>   
>       @staticmethod
> -    def download_nvd_year(nvd_path, year):
> +    def download_nvd_year(nvd_path, nvd_base_url, year):
>           metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
>           path_metaf = os.path.join(nvd_path, metaf)
>           jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
> @@ -94,7 +93,7 @@ class CVE:
>               return path_jsonf_gz
>   
>           # If not, we download the meta file
> -        url = "%s/%s" % (NVD_BASE_URL, metaf)
> +        url = "%s/%s/%s" % (nvd_base_url, NVD_JSON_VERSION, metaf)
>           print("Getting %s" % url)
>           page_meta = requests.get(url)
>           page_meta.raise_for_status()
> @@ -110,7 +109,7 @@ class CVE:
>                   return path_jsonf_gz
>   
>           # Grab the compressed JSON NVD, and write files to disk
> -        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
> +        url = "%s/%s/%s" % (nvd_base_url, NVD_JSON_VERSION, jsonf_gz)
>           print("Getting %s" % url)
>           page_json = requests.get(url)
>           page_json.raise_for_status()
> @@ -119,14 +118,14 @@ class CVE:
>           return path_jsonf_gz
>   
>       @classmethod
> -    def read_nvd_dir(cls, nvd_dir):
> +    def read_nvd_dir(cls, nvd_dir, nvd_base_url):
>           """
>           Iterate over all the CVEs contained in NIST Vulnerability Database
>           feeds since NVD_START_YEAR. If the files are missing or outdated in
>           nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
>           """
>           for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
> -            filename = CVE.download_nvd_year(nvd_dir, year)
> +            filename = CVE.download_nvd_year(nvd_dir, nvd_base_url, year)
>               try:
>                   content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
>               except:  # noqa: E722
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cc91d13167..5192d36857 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -583,7 +583,7 @@ def check_package_cve_affects(cve, cpe_product_pkgs):
>                   pkg.cves.append(cve.identifier)
>   
>   
> -def check_package_cves(nvd_path, packages):
> +def check_package_cves(nvd_path, nvd_base_url, packages):
>       if not os.path.isdir(nvd_path):
>           os.makedirs(nvd_path)
>   
> @@ -601,7 +601,7 @@ def check_package_cves(nvd_path, packages):
>           else:
>               cpe_product_pkgs[pkg.name].append(pkg)
>   
> -    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
> +    for cve in cvecheck.CVE.read_nvd_dir(nvd_path, nvd_base_url):
>           check_package_cve_affects(cve, cpe_product_pkgs)
>   
>       for pkg in packages:
> @@ -612,8 +612,8 @@ def check_package_cves(nvd_path, packages):
>                   pkg.status['cve'] = ("ok", "not affected by CVEs")
>   
>   
> -def check_package_cpes(nvd_path, packages):
> -    cpedb = CPEDB(nvd_path)
> +def check_package_cpes(nvd_path, cpedb_base_url, packages):
> +    cpedb = CPEDB(nvd_path, cpedb_base_url)
>       cpedb.get_xml_dict()
>       for p in packages:
>           if not p.cpeid:
> @@ -1101,6 +1101,10 @@ def parse_args():
>                             help='List of packages (comma separated)')
>       parser.add_argument('--nvd-path', dest='nvd_path',
>                           help='Path to the local NVD database', type=resolvepath)
> +    parser.add_argument('--cpedb-base-url', dest='cpedb_base_url',
> +                          help='CPE database wensite base url')
> +    parser.add_argument('--nvd-base-url', dest='nvd_base_url',
> +                          help='NVD website base url')
>       args = parser.parse_args()
>       if not args.html and not args.json:
>           parser.error('at least one of --html or --json (or both) is required')
> @@ -1155,8 +1159,8 @@ def __main__():
>       loop.run_until_complete(check_package_latest_version(packages))
>       if args.nvd_path:
>           print("Checking packages CVEs")
> -        check_package_cves(args.nvd_path, packages)
> -        check_package_cpes(args.nvd_path, packages)
> +        check_package_cves(args.nvd_path, args.nvd_base_url, packages)
> +        check_package_cpes(args.nvd_path, args.cpedb_base_url, packages)
>       print("Calculate stats")
>       stats = calculate_stats(packages)
>       if args.html:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
