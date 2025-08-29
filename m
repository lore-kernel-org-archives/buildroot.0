Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B751ACA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 16:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A4441835;
	Fri, 29 Aug 2025 16:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1i7pzz30nMH; Fri, 29 Aug 2025 16:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 861944192F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861944192F;
	Fri, 29 Aug 2025 16:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA9869
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E4196167D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnjNMdtQjTV7 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 16:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A3C5615D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3C5615D2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A3C5615D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:54:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80C01B9782D8; Fri, 29 Aug 2025 18:54:34 +0200 (CEST)
Message-ID: <6d9a4dd3-3b6d-4912-9a20-b2dd8552b832@rnout.be>
Date: Fri, 29 Aug 2025 18:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
References: <20241108231236.2838-1-git@jdknight.me>
 <20241108231236.2838-2-git@jdknight.me>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241108231236.2838-2-git@jdknight.me>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756486475; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yrJ6c3H+3/0PYMHDk+MdZbcp2XIjrQJYV7v2Ps6iIC4=;
 b=nvhTiUupzLjLhQsvPslHQV3Tgn6utW9+eUdnA7e5WBtKFxVbPb0N+uizWkp0fONIBPlSlo
 qpvurCGb6J4sVlhHE6RfIj0QOsqsO4Ve3yaVUf0MzQzjRtEAPDcsHDQfF3ekLfbjTMXbEh
 3bXkNNGmyToLclW5R8rqbvMHTZZM9mvMIpWrbftlGE1zMv6Cd9vE8bGbLxzHkCdoqGRakA
 Z24lOWfRs6zEMh+7ITruzjx3PJdPOOKuRrEQ+DgYZW+jjQw968N+/w8qcMglt2Ak+MTCcA
 Zat+UCQUEOBM5L1WZYzkmbPG93/PoyPeeSVvkT87JW8dZjP+0N3N3ffhhTsMdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nvhTiUup
Subject: Re: [Buildroot] [PATCH v2 2/2] support: add a kernel version
 configuration helper script
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/11/2024 00:12, James Knight wrote:
> Provides a helper script which can be used to quickly synchronize the
> kernel versions defined in the Linux's `Config.in` file based on the
> contents populated inside `linux.hash`.
> 
> The goal of this script is to help the maintenance effort required when
> possibly supporting all active Linux LTS versions in the tree at a
> given time.
> 
> Signed-off-by: James Knight <git@jdknight.me>

  I just merged a script that does it much better, because it downloads the sha 
file from kernel.org and updates the hash file from that. See
utils/bump-stable-kernel-versions

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - Introduced in the v2 of this series.
> 
> This is optional. No worries if not desired.
> ---
>   support/scripts/sync-kernel-versions.py | 142 ++++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
>   create mode 100755 support/scripts/sync-kernel-versions.py
> 
> diff --git a/support/scripts/sync-kernel-versions.py b/support/scripts/sync-kernel-versions.py
> new file mode 100755
> index 0000000000000000000000000000000000000000..2684b052657b0b98ac0265cd1b74a514d03ba9ca
> --- /dev/null
> +++ b/support/scripts/sync-kernel-versions.py
> @@ -0,0 +1,142 @@
> +#!/usr/bin/env python3
> +#
> +# Provides a script to allow the automatic updating of a Linux
> +# package's `Config.in` file based on the version information detailed
> +# in a `linux.hash` file.
> +
> +from pathlib import Path
> +import argparse
> +import re
> +
> +
> +# searching for a version pattern inside a `linux.hash` file
> +LINUX_VERSION_PATTERN = r'.*-([1-9]+.*)\.t.*'
> +
> +
> +def main():
> +    # argument parsing
> +    parser = argparse.ArgumentParser()
> +    parser.add_argument('--dry-run', action='store_true',
> +                        help='Do not change any files')
> +    parser.add_argument('--verbose', action='store_true',
> +                        help='Output additional information')
> +    args = parser.parse_args()
> +
> +    # helpers
> +    def verbose(msg):
> +        if args.verbose:
> +            print(f'(verbose) {msg}')
> +
> +    # find the linux package folder
> +    br_dir = Path(__file__).parent.parent.parent
> +
> +    linux_pkg_dir = br_dir / 'linux'
> +    if not linux_pkg_dir.is_dir():
> +        print('unable to find the linux package folder')
> +        return 1
> +
> +    linux_conf = linux_pkg_dir / 'Config.in'
> +    if not linux_conf.is_file():
> +        print('unable to find the linux configuration file')
> +        return 1
> +
> +    linux_hash = linux_pkg_dir / 'linux.hash'
> +    if not linux_hash.is_file():
> +        print('unable to find the linux hash file')
> +        return 1
> +
> +    # extract expected linux entries from the hash file
> +    try:
> +        with linux_hash.open(encoding='utf-8') as f:
> +            raw_hash_output = f.readlines()
> +    except OSError as e:
> +        print(f'error reading file {linux_hash}: {e}')
> +        return 1
> +
> +    entries = {}
> +    for hash_entry in raw_hash_output:
> +        if hash_entry.startswith('sha'):
> +            _, _, fname = hash_entry.strip().split(maxsplit=2)
> +            if fname.startswith('linux-'):
> +                verbose(f'detected linux entry: {fname}')
> +
> +                match = re.search(LINUX_VERSION_PATTERN, fname)
> +                if match:
> +                    vnum = match.group(1)
> +                    ventry = extract_ventry(vnum)
> +                    entries[ventry] = vnum
> +                    verbose(f'detected linux version ({fname}): {vnum}')
> +                else:
> +                    verbose(f'unable to detect linux version: {fname}')
> +
> +    # read the existing Linux configuration file
> +    conf_contents = []
> +    has_updated = False
> +    process_cfg = None
> +    try:
> +        with linux_conf.open(encoding='utf-8') as f:
> +            lines = f.read().splitlines()
> +            for line in lines:
> +                # wait until we are processing the kernel version section
> +                if process_cfg is None:
> +                    if 'config BR2_LINUX_KERNEL_VERSION' in line:
> +                        process_cfg = True
> +
> +                # if we are processing, check each version entry for any
> +                # updates that are required
> +                elif process_cfg:
> +                    # stop if the section is done
> +                    if not line:
> +                        process_cfg = False
> +                    # check if this is a linux configuration entry that
> +                    # might need to be updated
> +                    elif 'default "' in line:
> +                        front, raw_version, tail = line.split(maxsplit=2)
> +                        vnum = raw_version.replace('"', '')
> +                        if '.' in vnum:
> +                            ventry = extract_ventry(vnum)
> +                            if ventry in entries:
> +                                new_vnum = entries[ventry]
> +                                # if the version is outdated, replace the line
> +                                if vnum != new_vnum:
> +                                    print(f'Sync: {vnum} -> {new_vnum}')
> +                                    line = f'\t{front} "{new_vnum}" {tail}'
> +                                    has_updated = True
> +
> +                conf_contents.append(line)
> +
> +    except OSError as e:
> +        print(f'error reading file {linux_conf}: {e}')
> +        return 1
> +
> +    # update the linux configuration file if we have new changes
> +    if has_updated and not args.dry_run:
> +        print(f'Updating: {linux_conf}')
> +        try:
> +            with linux_conf.open('w', encoding='utf-8', newline='') as f:
> +                for line in conf_contents:
> +                    f.write(f'{line}\n')
> +
> +        except OSError as e:
> +            print(f'error writing file {linux_conf}: {e}')
> +            return 1
> +
> +    if not has_updated:
> +        print('No outdated versions.')
> +
> +    return 0
> +
> +
> +def extract_ventry(vnum):
> +    vmaj, vmin, _ = vnum.split('.', maxsplit=2)
> +
> +    ventry = f'{vmaj}.{vmin}'
> +    if '-' in vnum:
> +        _, postfix = vnum.split('-', maxsplit=1)
> +        ventry += f'-{postfix}'
> +
> +    return ventry
> +
> +
> +if __name__ == "__main__":
> +    raise SystemExit(main())

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
