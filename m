Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF9CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 03:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169BB40613;
	Tue, 13 Oct 2026 03:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq-9GzCiPVEg; Tue, 13 Oct 2026 03:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB41B405E9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791862536;
	b=oPFnsgJv+rHJCKm4yBr4zXC/SffoArafE1hnbvA1DPnkzcbnLkWW6DqJu1cd/Yt2hg7/
	 Ty6+MOgy8lk8U7k0YZhZ7Xk/Y/VJCkNDOekNYRCx5gaI3gxSjTzD0gVjx0yaayayf+0bb
	 WAyjwaP0vfDBbSWwel/PjCdK57csZJqW1ThErwm+pskMDSRTjy/TtXifyavA1CqwDb0j5
	 61k+1yW3FIl+izzwpVSS5YpxbOvvtwVLtUs5LEbiE2HNWkueRhGGIzL7w3wRWcaJxFCPm
	 jC/r1YPZ8UivutM76831ids8nmcqDOuTpGXQj0eWUtYD1Lnkfwji2F72d4O3C7M9rvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791862536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRzvUU6+mNRoPEB5z1TowFGbOdikPuYLt4+lr2Pp+co=;
	b=W2RDVJEz+Fy6VpEEs0Hoxs3hhXyrs/FHWGMQBg3iuVFhlxHEVdWgFTCTJEGYXNvxw2H7
	 mv7d4PpAxMvc6cuie9fEdEYf5i+UK0EhjvnnndoCHYGOCKTwsWDEQVvEF3dukqAxBkxG0
	 IhyUAvNQeZeudx10LU8ZBgcSrEzcslZkvzZ5HG1iUeaX3T6LxuyFZHx7SnmbQJ4oJ3FbH
	 ZlsXDd0NLw6s2R8o0KfGUVC+jz/Zxkuye5xKyD9Zvr+EDmxh1VvWRZ9Ed0afrWcjlIQab
	 KhcbouEB+GBhfFvBCvVrsUwuxNHXwHll92cwTJ4navzu8dVkDkyNJJwltUxYCB+tCnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791862536;
	bh=DRzvUU6+mNRoPEB5z1TowFGbOdikPuYLt4+lr2Pp+co=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OcSsYOr2uvx5ojkmjksnKBDP/6U9kn3gPe35LJHKrGOqd3UvXSHGofT+9C/rA8zQG
	 NaYjdZ9aM/4bcgtT6UrdVvvEUlj8F8wsj0Ocd96YYThodScXRLqbfaITvRlrtTwLJb
	 ezQFkx0H4WCn2vdaTfDcJeIb2sGw2xDRzLiuZ4n4KqViw8rQjA3yPdl588DB+on272
	 PT+2Cdr+qFmo3rhANMjGjKewKcXm4d8IT57UT5X2tF02PBERIBG39vUhP+dBpFnBNh
	 3t2BYTlwzUSa8owt8UXAl+9PPnRtGx8K6XfBEH1Asak+EaWHZNk/FKwB9MuLaNxxXe
	 7okcxzJR9lTvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB41B405E9;
	Tue, 13 Oct 2026 03:35:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 965A24DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 03:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C0D180B86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 03:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhtEUJVbnrg4 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 03:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DAAE080AEF
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791862533;
 b=YMCFZ5hMRbwT9t8LEJmezYnkxgx3Mrmj256eXRcYbvgImu+sv4RRH+08su1nnxzpg3g9
 k6QYliwgaBTCCG60fVkHZhYRvYDL0qEL2avyHhbh8Gz5DPpyHI3GjzoyqR96Ud+OIIApu
 R+bg+kYTaNuuensPiuGYr2OjzBCMdBArBmHb8szm5vmtSNfXV8HgL6JvldUHu9bgx0dY8
 Byw7BD9TRtCdE4f9bXmwU0MVGHkFTg6OGfE+oe9sxljAfCmi72ZNkfoGxRhK2r/Fz3z0A
 dyyGkUxdCSuUNzUGHaGLtdDUl20Oesy/Zd/jSc2dWA5RblCyUdOBurpo+F/tSXDS0jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791862533;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=ltbLwPQ/Po5a6yCMwDiVhFO8aRd081Am3L3sCiKMXys=;
 b=htShY7nkxRNc5HKNSzXpyN5TG987Bc94S5iTbcsUSdTSOa+QNQy5QmzPAQzdQ8jM12sw
 QN3wnnE59rWEJEiDSJSiFQpEe15GuQLvC9MmliZn2pfoDtVaK39qnhNhr8f7xKd4KZo4d
 X6PE/JJFShWSSvvcmmjJ5d+DjSVOQbnBERpFsNW0ZtTgX/jrnunb1QesxxVWxskj8SP4C
 dyrc6QYgjK/OaNwhwS1BmCFY7tVJDQspwNpNxut02VzJx0nLHoSYN3p+cowGGG8E+XPmV
 FvvwwCGzqKyeXBIeCuArA/DU5+uohn53oz7eAwd/1CwHm4tueckoXcCoYaVZHDoB/AQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="d/Vd8Cj+"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=d/Vd8Cj+
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAAE080AEF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 03:35:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so21242485e9.0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 20:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791862530; x=1792467330; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ltbLwPQ/Po5a6yCMwDiVhFO8aRd081Am3L3sCiKMXys=;
 b=d/Vd8Cj+u6dEzTH69pSbELLXZD/k/2MEiHDVhs2UrkVcCPX/TDWx6BtD5O4WVhdUVp
 K6I4SOt4fGyeCKFQ1dGJRTLMv9MUdriqdVrxugVheaY0LzpXs4vEKQwPAYBi6t1c+lMH
 tCz+aEujco7lYnKNgOurAIddsubQ2Rg6OQrqcH207XnpfadnEFf+Diqb1Ywk5kyb1/vl
 N+wpLXVuusByBGDpWXaCZfd0YpmDI5NLatswUY9BA5K5dHNzQVsim8Y8zgQw05XD87xg
 WQtIWDfErxCsCtuitbvIbYPZZtNilPTFTJgn2yVta3+R8lKaU3UULrWjKolEjyMrQh+f
 Y+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791862530; x=1792467330;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ltbLwPQ/Po5a6yCMwDiVhFO8aRd081Am3L3sCiKMXys=;
 b=XdXje6zKKPz1YRnNJLhbQfhSnwC5VPT85m6li81AYjmnuOS8IBervDP3Egsl0UHQWx
 O5MLm7wRahU2vUS9FejtLhi4svqyWfWUAEP3IEt6+6TJtc2EQNdgcMbVF3B9O/hUYdER
 bMCEO8I06dJzuYsTf+t3xKfnotAYif/Qp22PL9dELS0pqLfPPvm8Uz1bornyHftXJ1Jz
 KGJJ0+o+99iiKG5x8LbGhBHU6STgUeeY0JU7aQln+hl4qeT5hDjnsascUT/TNsy4/41t
 m8600bMTdo0B1Gv2+H5bv416+a0y3peii04hXhsQqy2y+ENtGoGDgXMgvhseKqC9u68e
 4yBQ==
X-Gm-Message-State: AFq9FYJj6fSAAtxXCyxEP0ALRYO3PcpYNWcwHVdOJeNCy1dA2xK4ucQ5
 ZZK/m/4Q87ntRUpGcJGyre6FtiRm/7+VS0ldwbTR91/WKk715zvbL8sRqGGRvipN
X-Gm-Gg: AYBFou1UfSp00JIuT0jJsTNvJBdL52yJ25RZh/E2/Nd1VgfWixkSAowqSdQvVCukIi+
 wOTdLsxTZOnWzbNE093v1sNZ4zmaazIYZYr1179xbBncoRknwVGXMxC7KmeVGAtqIQhPmEnS1Xv
 boAB7BFBo72Z5h/hPlaokPBgn2K70oxXcbwO08vo6ehULs7rKm8WwHjrWH5GK299eg02O+1Tnel
 F9jbBUDLdKkfxMIO3tWzJSnTqXwODrGRYkbWgbalouLERNDpmr9KuG+MKoCmsU+IoLuoQ2+04g2
 qjoJahbdzhqQG139TG6dqU1Q4Zun27C9f3+QI8IygHV0FfcHZr+zefwGz7qhu/GLFspkZtLVTQU
 VGh0cKlUSRppSL0UCtRD4nXuFJokaHh9C6IRXeAtan55cbDm7nTYfM4RchdzEecKR8jabSo7fAh
 sb9QoSZ3uH3Yz2Bl0t4GsF7BMaL5kWGAe1lVtgXze/07wUPh1dCipCmvSpQff3GWUVLG5hjenbF
 g==
X-Received: by 2002:a05:600d:8488:10b0:4a1:9078:911 with SMTP id
 5b1f17b1804b1-4a190780997mr140653135e9.31.1791862530183; 
 Mon, 12 Oct 2026 20:35:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c85009csm259197555e9.2.2026.10.12.20.35.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 20:35:29 -0700 (PDT)
Message-ID: <6acda701.c9b93fe4.10c2a7.9898@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 13 Oct 2026 03:35:29 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-10-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 24  |  0  | 32  |
  2026.05.x  |  4  |  4  |  0  |  8  |
  2026.08.x  |  6  | 11  |  0  | 17  |
    master   | 61  | 183 |  8  | 252 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 21
              libmodbus-3.1.12 | 18
                     host-rust | 8 
            host-gauche-0.9.12 | 6 
                 libclc-23.1.3 | 6 
                       unknown | 6 
               libepoxy-1.5.10 | 5 
       python-dbus-fast-5.0.14 | 5 
             alsa-lib-1.2.16.1 | 4 
                libmdbx-0.13.6 | 4 
                    attr-2.6.0 | 3 
                   dante-1.4.4 | 3 
                  iozone-3.508 | 3 
         linux-headers-6.6.158 | 3 
      passt-2026_07_28.f8df3f1 | 3 
                 systemd-258.7 | 3 
             batman-adv-2025.4 | 2 
                   ccrypt-1.11 | 2 
                   dbus-1.16.2 | 2 
            dt-utils-2023.11.0 | 2 
                 haproxy-3.4.4 | 2 
                host-odb-2.4.0 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
                   linux-7.2.9 | 2 
        ltp-testsuite-20260529 | 2 
                  mender-3.5.3 | 2 
                openntpd-6.8p1 | 2 
   openvmtools-13.1.0-25218885 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
                rdma-core-62.0 | 2 
                 uclibc-1.0.59 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                  bcusdk-0.0.5 | 1 
                  boinc-8.2.11 | 1 
                  broot-1.60.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
             docker-cli-28.5.2 | 1 
         docker-compose-2.40.3 | 1 
                 dovecot-2.4.5 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.21 | 1 
              execline-2.9.6.1 | 1 
firmware-utils-c42a3bc53da8... | 1 
                flannel-0.26.0 | 1 
               gocryptfs-2.3.2 | 1 
                   gupnp-1.6.9 | 1 
         host-gcc-final-15.3.0 | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
host-python-types-psutil-7.... | 1 
         host-ti-cgt-pru-2.3.3 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
               libcgroup-2.0.3 | 1 
libdill-32d0e8b733416208e04... | 1 
               libecoli-0.11.3 | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
                 libjcat-0.2.3 | 1 
          libmicrohttpd-1.0.10 | 1 
              libopenssl-3.6.5 | 1 
                libupnpp-1.0.3 | 1 
                 libzlib-1.3.2 | 1 
                linux-5.15.222 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                 nerdctl-1.7.3 | 1 
            nodejs-src-22.23.2 | 1 
                opendoas-6.8.2 | 1 
                openssh-10.6p1 | 1 
                   perl-5.42.3 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-50.0.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.14.8 | 1 
            quickjs-2026-06-04 | 1 
          refpolicy-2.20250923 | 1 
                rocksdb-11.0.4 | 1 
                      rtai-5.3 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 sudo-1.9.17p2 | 1 
               tcf-agent-1.8.0 | 1 
            timescaledb-2.28.3 | 1 
           uboot-tools-2026.07 | 1 
ulog-0389d243352255f6182326... | 1 
          usb_modeswitch-2.6.2 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/568d85a221cb06cd02b670527b2bc8d98375ebd8 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/fc4165630617a59eafd34c189e24085ce5533f04 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/396b6b128a3f2bd546909b838ba8cfbb052347f2 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/5ef2ceb202edefe8da22e351ca0a22f5b8254bd2 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/289ffba7b2c26e1845e035b15fd39268d6f7c5e0 | ORPH
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/3b7a1c38bce31ff2f2eb4d3fa9d63f5e48a4c56b |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e353003d1fba95be701f29763fb0c35007066665 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/62e60ade470f531e73d502bc8332bef302060a2f |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/c81e86ad23dce1184a8cc90147a733972ff046c8 |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/f1afd54e4e3c95d1f0db4b3241d21a91d3148f15 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/70df6e11b177c802952c46f2d38bf12afb9d3427 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/be9f8ca82d5df090aa2c5ce6c491b9fbcf9fcc9e |     
    i586     |          broot-1.60.1          | NOK | https://autobuild.buildroot.org/results/fdbfbbf44662617cc31e8e19e7e70346aab3be60 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/0ad75a1fe57c500099b8a86d5b8ef6e318a7501f | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cf65a842084bbd81b27f41142e71043faffeadb7 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e33f78f31627e55263529fab0f46b7ac5d10648 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8be8c0fb3c489aefe8ff77c09ca7ddb8e5d063e4 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cd7396a3107c58590b4457ade056e04c31a221f1 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1d692d57f6feef97a4e9607088b38d2856907c42 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/59570d577ea9d32f340e8b282383f3aaa9249971 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/74b65ba564f2d4ac215437f8a70527a6fb0cba8d | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/85f2c0250302ed165415d6f8b4eb7d6ce16218cc |     
    i686     |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/80c85cfce160dc4b6d3b814ccdac2e5d62336d67 |     
    i586     |     docker-compose-2.40.3      | NOK | https://autobuild.buildroot.org/results/44b159fc6aa80b0ce2e13ae925f2b6b9e592df52 |     
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/33dbae22cd47b7ef11c9ea8c8d1bc55eaed5be70 |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/78f51ff806f02bb5ea0c6d8c77dcaae2b301c545 |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/a51488fba9a6d00a9ca5bef04eda4b2e6d295060 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/a4256ec4f39ce10ae76bd36cdf36ca9eec36f309 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/575c42a83e851cc81f36fc9834de2e054ab23a12 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/70342ee587ffbe656f71582eae44c4ebb51faa01 |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/6eed143f01432779c679f6b08dc3485d6c5992be |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/fb9c1fb49da245a2c6a4d9b5bc5cf117c6d49317 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/1b2f09ccefb1642976d5c8b48dcf03196707efe4 |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/9100d3c5eafeb8e1aaf511901090e290c8e83c9c |     
loongarch64  |          gupnp-1.6.9           | NOK | https://autobuild.buildroot.org/results/ccaac9f25ceaa7ef3436eb092b0f2034d8c58a7d |     
   armeb     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/0ce3571cfc633a6dd70b147e3601fc44cf6afc6a |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/e09204d8d1f9e4cf8cfcd0540872ea6b709182a9 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/a2fda4b202661b100d2ce5706c1064cc1d201cde |     
    arm      |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/84f3a9d95c4e3c53f194e620323058183ab02fdc |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/38501ef94e482aaedc3f25055ceaa89a66e6cef1 |     
    i586     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/d5cfcb06a7108a83a5e17a90af18e1276c5ac6b4 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/a999c69fb2203dd97e708e728107db44e8af6171 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/5d2a0843800432eca1905b20afdfeba5ea1ad875 |     
powerpc64le  |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/b518b2c682cdba4dfa11724354a620d3ce00dd59 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ed1a7ddffa0f65db6b9bc816841142e2b51a6ac | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2db45f53cb3a90266bbdfd8fcf7498c4496f30e5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dbb2d6441a633b619db9657f9683f8f82371e098 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ec11f58968b873ab0ceeef1c939f32f38c6d218 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e746dde60d6d580d3b7bcc23df4f0dbc3cc6128 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/adbb619f71ab377654fd418f3076f7656815fdc9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/69708c025be773713becaa8188dbff39672a53b8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/74bf002e155015086760543b3dfea5483ebc1e45 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5bb6d7c3f5b56157207be056d47f2bdbc65c7b7a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b10023361be135bd4ba4044353963975b69836f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1b7f7f62ce4c3dbdd2dfabc3460f731135af7513 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c881366ba9c1ab517ce71fde8cf6648c5fa9c9f3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2010b5156dc4e2f908551266e4404a9bc8a2b5a5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c259886f8649cd6edffa0bb058ef88729565d8ba | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9c88edca762e2cb18f25fb084becc965b3370dfa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f71bf8592cf5a3be5ac5843e84821a9f9c99b078 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/74926a8d50fda3c2fefe00cb2c1c43498b04534b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d92fd8a94ed0ced36fd8b5281757c235c9474fc0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a990ca57e3202c5c5100f237382cd073f529a4f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b8844dc5f5c1a549ab09b139061b1ebcc24c4a2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a717933b048e6e72590ea831bcf62c0b0b09d8b5 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/50fe8095598cf98b146fcdd7602d9952bc12908a |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/39a2d009fa1e2600a27dee7f7d599b986811f364 |     
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5eb8f8063a4cf4f802a24569b74726577072456a | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/84ff16032ef75d185fa1337397b376a0366bb498 | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/613b09656d0a405ee8991d9d78fd135726ee622f |     
    i586     |           host-rust            | TIM | https://autobuild.buildroot.org/results/8da98f65ba1ffbf8f2b2b378917897b99c8d6ef4 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/34f3bade0cc6209cd73feb1a82acf5b94c88205a |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/9f4bae62162185fd983976d15736e8d9e81dd38c |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/a01df85f48efc71718a6754928055e868dcfb4d2 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/194ea3140606667340929fce0a44488cf06b7f63 |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/f4e002ff608e23587be9f7e560e9cd628e7a81b0 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/ce85fe6e886ec9e1b1a3e5a18da5ae9d2d6a3dd7 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/7b9779b9927719b5451d2de968447d444048036c |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/b49ddb348334c1c80af29fa8d5467f3e8bb5c682 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ecdee72f85de54c8da8f0b623294789769711619 | ORPH
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d19c5e729b0ffe9d7715e8551eaa5f780fb48188 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/220ba151121ecb2a3a379810b73974ac265ccb15 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/74d7e505976f6c69126469972c85258875059c2b |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/cfb53030e431475ee57cd2b8e9d9cb55cae51002 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e2cd3d4fe4c5f4c5a7872e312ff1b54f8a1a1d16 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/054c07fc5571a27bf8a2e7c973cc474ef1350bcf |     
   x86_64    |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/9973a7f38fa5a30890390772f7ec1512e10dd8ea | ORPH
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/aa698c0328ff642fa109e1c031c11fb881f47fe1 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/4cf848bb34db59fdb5ffd43ff0a02532fd8f4cd3 |     
    i586     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/62fdec8c19af0abc4649223ba9b64bec471b2c62 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/3c6fb49e0fdde3d98f7b752a07523f4dcdc96caf |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/b395b52ebd1eed7c7a9f7605e12eaf139fcf0795 |     
   armeb     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/3fcdcb71be590b090df2f765c68aeaecc44dd215 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f0e758423c7e55bc878b420b38dfa8066cf0eeb1 |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/060391a50eb1605709ce60f5124a6f793e674daa |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d8ff5ceb150ae4bd5a9126b00c76c2dc3ce4503b |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/54c368df637842d5540cf19ac5ad995c092892af |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/aed88622f42c351caa136d6efc533b76c39eda7e |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/aa121dd7e7c409dcc0c639f535ba37aa5370d2c8 |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/6b0ce97c63c3d6402fae65582da04f3d125aa99a |     
    i686     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/2d17d9e4eef39aaf12571ab6fc9cbbfae41c70e7 |     
   x86_64    |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/b294ce88fba8d34a4739cc2dddf486c879152709 |     
   armeb     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/b341dedd9f43cca59c08af21491417a1efbd5bc9 |     
    i686     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/df6d288df20ba1d06557ef090f1a86b26bd0959d |     
  mips64el   |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/844a558655845f50e072aa6211f60d1cb88c2f71 |     
    i686     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/6af7bccfb05c448fc430a7be76e45ebd08f3922d |     
  aarch64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/a5cae6a1a9c0e7ddc54ff3430ea1dbdc236d690d |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7f87f48e284a0ab25786b7d85c1e4db7648a6d79 |     
   s390x     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5bf9985d015ba8bfd5e60235613691be8cdc5b91 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/fb18b90efb9e1b8cfceaae6493281c633b8b3bb0 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1031f0f6306eee868893a75cb7dea23dc0091252 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/711fbe62553b2855f717c4656841bf2b4789be62 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/105f9426c4db82deedb55331d4da79fd9ae1bc82 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/693dc614245c132ef9168eac212cfb0bd945b63b |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1776c5a572c4b2c3c54cc4286ad88e78e7e1d9a4 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/05ef1d7a50061c557d30c7e6b30489eca67efb01 |     
    or1k     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/926c7522c0bc8d5c518fc2ca3bb86f628a765c65 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a756be9649f123ce4edee7fb7b10a257bf2e077a |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5d00cdc4f93d2d3f75d5cc26987f54785b68b53c |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/da3f084479edaeed35474ed0169af12efcabd746 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7993b2a4b1bb941b36af867c80be8cbafc105e79 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4c371ad6dd6c140ba4571ab6c1f2051035ac9f35 |     
   s390x     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/15c6a8c8d32314c37963f18709bff7e67f310a46 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d078037951beb69174d5b8cf7b55b374ef2bee9e |     
    i586     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d7c664702033527dd83662d99694ca17ec2f341a |     
  riscv64    |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/36dd3b58ba37bd7318a7681c94f44ce4bd6c5538 |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/f1cead8043db7083327d80e49be4d0007e9eca48 | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/adb5998bc41e22b66c296c3689b121ba3fe7eb75 | ORPH
    i686     |         linux-5.15.222         | NOK | https://autobuild.buildroot.org/results/4d122e484820a309e923b63390494aa8f2e050b3 | ORPH
    i686     |          linux-7.2.9           | NOK | https://autobuild.buildroot.org/results/ec01e8e4cd4f0b071a6385ff0b9d3c441fc5a4c3 | ORPH
    i686     |          linux-7.2.9           | NOK | https://autobuild.buildroot.org/results/35fc9d577cccaef047a62f9624f67453821cb3a5 | ORPH
  mips64el   |     linux-headers-6.6.158      | NOK | https://autobuild.buildroot.org/results/74e1fb7526f96ce4b0cc7c6fa25790912e0fde64 | ORPH
powerpc64le  |     linux-headers-6.6.158      | NOK | https://autobuild.buildroot.org/results/0ab40e1b1ba35c53f8785fc60dc143192884dbe7 | ORPH
    i686     |     linux-headers-6.6.158      | NOK | https://autobuild.buildroot.org/results/01c0a5b8aac7e642f75a149e54124b90a34f9244 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/81613fb0f94c619efb81f41fbb26415df4e62e2d | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7555b2b16ec81cd152736d36950a37d5bee05adf | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/605ca4cd2d502730f2cfa614cb39340b7aebf0c0 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/80d2b267c35ee1538634a9847658bf3fe4218c96 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/750cb29a88ea8146735a56c131662bc7cc2f4dba |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/54a63b1548f7205a11ffd61fb3b39e976835976c |     
    i686     |         nerdctl-1.7.3          | NOK | https://autobuild.buildroot.org/results/a840b065320648aba8eb9313793d715d78bcbd4e |     
    i686     |       nodejs-src-22.23.2       | NOK | https://autobuild.buildroot.org/results/fa14daf06b8805d2aa4bb144e0916713f0efa31b |     
    i686     |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/4b5b0ab0de6427998393ce6cd67a003648abf75c |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/872b198684dd636bd0e6e12b0a64cac0b995aec6 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/64b3bc2858cd45d946b90c6b1f02299474bd10a3 | ORPH
  mips64el   |         openssh-10.6p1         | NOK | https://autobuild.buildroot.org/results/154f7565e2ee718a7b90e8cd9186c13812a06df8 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/086e4d510cc19963d462bfa613acdbe33dcd2ab4 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/c12dd16ab61db5297c32d99eb48d009d6e359c4a |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/2aa4f0c60d5d948ec688aa9d8c6f570bc230370a | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/47edad1665238c269746c19793170a146146ee1a | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/111f603b92ad32e2cbe24a0b87b601339394d3a7 | ORPH
 aarch64_be  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c034f1fd3ee7448dbe1ab86c29abd5b4d2acc7aa |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4aa77e78190cdf0f03e30b2670984eb4b9148966 | ORPH
    i686     |   python-cryptography-50.0.2   | NOK | https://autobuild.buildroot.org/results/9842c2bf53f08df7b67d231bbf5aa3409c71deb7 |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/712d67c756a2e90f405598fe8c8cd6f2f914fbc7 |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/df146b89e48ccbc7620faf2d26060fb49cef5005 |     
powerpc64le  |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/5cb6e207805c2925edf0b704a28b73cf1a5ce4ca |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/15606cc43908a80465222c8b3c6dd5695f6ed18b |     
    hppa     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/bba777632f1803271e034feda8c0a44759863119 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/716bfedb364ce64acbb0e717679fbf762f560b25 |     
    i686     |         python3-3.14.8         | NOK | https://autobuild.buildroot.org/results/7519d8a351ab87308fa142524ed42656d4405143 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/4774c5c7d85221ed3412e5df8b9b1ac60a38cfcb |     
  sparc64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/c0d51f946cd9f69a2a81c6886c19be9d6c1f25ad |     
   xtensa    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/ae63ab2e4f2c564e8f64ed923c6230db691fe960 |     
microblazeel |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/776880c3e7ee06ff68d8c98ae7cf1c01c8ffbe15 |     
 microblaze  |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/69e61c5b81245f74548bfd491a4ec378120faa17 |     
  aarch64    |      refpolicy-2.20250923      | NOK | https://autobuild.buildroot.org/results/7f9562337fc8aafb6043e825f68ecd2af9a7eeb7 |     
powerpc64le  |         rocksdb-11.0.4         | NOK | https://autobuild.buildroot.org/results/0a4b07422b7a200b5fe908c2755078240699c1bb |     
    i686     |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/4f3ebdceef7edb22408a211f5c69faa6f7b05e33 | ORPH
    arm      | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/c65179c9da867d18d0f4d31fe798c3957b6727f1 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/c2a02393629ebc066febd266ca42a7eac3e226e4 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/d35df4740d2a66966e585d1044cab0d6c490163c |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/407ac3995f710aa1eac54e1fcc7e735d74087ce0 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ed9c26262c11cb2300edb5d1d1e5c64489811f9e |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6f874fafa125fc4c1152e46dc329d95e371d7090 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9ebd642fd2fc73cf6a26056ef1778141e97d6606 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5e03f0e2b8b6ab6ca7bee6be4d158bad536d87d4 |     
    i686     |       timescaledb-2.28.3       | NOK | https://autobuild.buildroot.org/results/4cb99d3ba062492962bb542afa5261a2247e3e67 |     
  riscv64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/8dcaf752e78feb383f8a8a7a313f0e9fb1e5e260 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/00b51c7d5bb47fa7ec1e53e40506fc221dafa3a8 |     
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/9c1489c018afff5b986ba7b5fc9af9c58223077f |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/49b05f18b1b17b6b41d9e1479bc765a288f84e90 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/88efef2fa6a3070c4c0162ddf4df8d612bd47451 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ae95a3cba7f21ac01017065e20139c7512967b14 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3c472cd7a429d643ea984b30ebce35666413031f |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/56f21dcdcf6448fa1ed795c93031f77e5b6f7cd3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f959ea79cca18cd08de5c01283d60593b3eff4dc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8784fb6f45ae34e96bf5581c16bf6683e8c1a5e8 |     
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/3355f7d5c7f175ef9a8d49f8418119e9639ec283 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/ddccbcb75477ef22d0631e7a1c4bc0eb049b0c3b |     
powerpc64le  |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/ed63af3e536ad0ba6ddba1c3fab2ef2559a7e568 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 
             alsa-lib-1.2.16.1 | 1 
amazon-ecr-credential-helpe... | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.21 | 1 
                   perl-5.42.3 | 1 
           python-zlmdb-23.1.1 | 1 
qt5base-bebdfd54917e25d1c10... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                       unknown | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b3ce9e39c4a7a2a15e98d63d9210bbb43eda403f |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/b2d77ee7b9a5066dedc554699f8da97117a2f02d |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d9c380810f2349d9296ebce76296b6f0dd205094 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d5316a90b4a5bb82230ed00b34624d35beb08f23 |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/51d8b3555c9610526b4baac2119d2ffa932b7746 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e713f1494a560cd4157af782616418159c19d018 |     
   x86_64    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/e3b026cb48f41ec531e5bdae9e07b8e581f1a06b |     
    i686     | qt5base-bebdfd54917e25d1c10... | NOK | https://autobuild.buildroot.org/results/fef19f6023ae37bfc5129b4c87dfab722d0f7ade |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/644c298ff804af0b8f1c713372e48bc7a0c362e5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0a9c279c29a1844eed35faaac5504b76f7e648ae |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b38b1a6ec873b8b3b48ef35140cce274673db80d |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

          aardvark-dns-v1.17.1 | 1 
  gobject-introspection-1.84.0 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                openssh-10.5p1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/57cfd45071b3e1dcc0bd60f19885d2cb2c96676e | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b02563dfef54519f296b762bc267997d3c49c1f2 | ORPH
    arm      |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/84f39dab8d6fdc1cbe92ca5c11953ca44c7fbf85 |     
  mips64el   |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/f534b57edd46d8fcdaff99103db9f91581ff1d27 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

rtmpdump-6f6bb1353fc84f4cc3... | 3 
                  iozone-3.508 | 2 
                   bird-2.15.1 | 1 
                  boinc-7.20.2 | 1 
             dahdi-linux-3.3.0 | 1 
                 fwupd-efi-1.7 | 1 
host-netsurf-buildsystem-75... | 1 
            host-skopeo-1.18.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                lmbench-3.0-a9 | 1 
                 logsurfer-1.8 | 1 
                 mbedtls-3.6.6 | 1 
                memtest86-7.20 | 1 
                  pdmenu-1.3.6 | 1 
                pipewire-1.2.8 | 1 
               pulseaudio-17.0 | 1 
        python-selenium-4.27.1 | 1 
          sphinxbase-5prealpha | 1 
                   swipl-9.2.9 | 1 
ulog-0389d243352255f6182326... | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/442d756aeb7ec36e9c29916e3822d9d9c6bebaaa |     
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/60c59e6e1a12e536e5e9b260b98e240982214acc |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/687cb991c261253433097aa2fa113347a27c55ec | ORPH
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/65bf52f30d8c3070b3d11d21e85dc0e20c65ab1d |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/44aa3aeec7fd36d2ce5c8ff9cb1d377e9b2746c5 | ORPH
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/2855a8c3252d6f19fc967ecea9e2fb7710b50f8b |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3d540d9f3fbc1943fa286e0a8c5f68273c31c6bb |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d086b22b592d33c3f690c34b6eee9a6a06105bfd |     
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/e2ef87ee1ac98856cc31c9de6ce67dad43c9fce7 | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/021f01411d648b7c05ccf56cd455fbfe651849d2 | ORPH
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/833ca34ccbb98123a8130aab2ce9d072db8e0ee8 |     
  aarch64    |         mbedtls-3.6.6          | NOK | https://autobuild.buildroot.org/results/3bbaf37ea89e847de6f3f1c38a2a5eb2f95807d0 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b46113645dbb2dd7594cabb2d9bae50e83dec666 |     
  aarch64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8d5a829bd1e6e11972a949c0e60521993c45dd20 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/463f8b3bf546166999b1e743e626d33aa8014256 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/39db562042289d160999cf5d7ebe74cd04b0c90f | ORPH
    i586     |     python-selenium-4.27.1     | NOK | https://autobuild.buildroot.org/results/5949847bf42a9764641a4c2ce2ca69e8c0e811b5 |     
  riscv64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/3aaffec26fa1b1636a3e43ac5bf17c92f87bcb3b |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/f7b1c9e30d3df76f332b5fe90f8d24850a5719b8 |     
   mips64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/2340c7e24ee676ab487a1afc441a5fc03642caa2 |     
    i586     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/17a08578bb1044331525e2c32d052a935b314502 |     
  mips64el   |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/0242eba1a91a5c69a0671a4437b07830ee0186bc |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/334fe4bea79064de05177562a1864cd11bff09a3 |     
powerpc64le  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/9c0bb6755683b027e8d7a46866bf7d6f5bbfa233 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
