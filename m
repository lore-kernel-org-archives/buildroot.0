Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4798ECAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F8A86153A;
	Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8a7G50iBgsbz; Thu, 25 Sep 2025 20:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E319B61556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E319B61556;
	Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 192D912D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B75B40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-UAw7qM44bv for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0397841275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0397841275
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0397841275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so7609455e9.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831403; x=1759436203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BTZ6Hv1zaX0bHXR+CmbHMZu+N5LHu1fnRYcAHI6b70=;
 b=WbCPHpq+wW0IKUcHdR8u9JgdL8Wwh9UwViwtfWLDsjUGxmd4HqAFFgfJLNLBPTebF+
 VGPWHkdVLnyn2TwggowNmJdzrj0D+u+Jxc/nNkwHIR5Gu7ipMybBVeeNHfG4SszombNe
 FENqfi0n+++BT15Kwb2qlvB5KWOcGkX9R4EY4WCDj1yOMh/yhQPQgK7DIh8fklc4I2Cx
 XD+fLeGMrxgkY1ofoOAthfdwezrp8hM4yEcg3VqknOadwbH9hafWaltShyh5vRaknM9m
 pwQDhaL+jfbhV2Nw8I+tVULY1ewzsGGis/AVYBX9rsKr/UknApwjUi79Tssni25WXKaf
 PnPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq2/csmpMD3Gt0BDBL547hVgcuI3hXLmPiBH6ZQRzSE85+d6217IBlucC95w2/m+MNnETRK/ojaWc=@buildroot.org
X-Gm-Message-State: AOJu0Yx59zBpvpw72qFxP3U4/54qXxn6NXg+nJk8A0h3h9rU5DDzA3RD
 +bvy+b9SLI0HPdWDvZmoAW+e5xhJ3NJz9+fcVkUNZOHoB2sFsZYG5lEMIMrZbW/9SaQ=
X-Gm-Gg: ASbGncsHgPfW8jvTNxkFJ3vonyjPMNpElG822EahHiSuO1enAEwbgpILuW9YvSxzzvi
 dyWvQDKQu8D6U7PcZoAHyQRNpSELQMbWquaTQroP+O9yOLiFx4gsZV/2RtgVwwTWrh1J+TJMOLH
 Qb4bwMflf+oNitp1GZavlerjvDuL1LddWPB42dKszzcESQEC3QwmeJVf1p/uMau/ECXzWx31uun
 S/d4tS/97Ll5D3/PLFv+ayRx57pUkSFucs6XzZRgAnvNdfx8Oa3JZzMZb7d3aCicUioeV/4VEaw
 MmDgRMgo+pW2yDRKobaoLd5YBwIOE2HBf15llhTC1TCjTay92PjCRHEpmDqoY0X7hw3aZGnhp/H
 xJZLTFRyEniGB1WQ=
X-Google-Smtp-Source: AGHT+IHbCdw8GrytGM3Uc7lLyJ9R0aP6WRz5krJhDyiHPGhUVSF7oA3ikZFkoQDkPwU2G1n8p95DJg==
X-Received: by 2002:a05:600c:620c:b0:45d:e775:d8b8 with SMTP id
 5b1f17b1804b1-46e33c297d7mr41766365e9.1.1758831403082; 
 Thu, 25 Sep 2025 13:16:43 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9e3bdsm50703725e9.2.2025.09.25.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:42 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:42 +0200
Message-ID: <20250925201642.43329-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915202737.1513190-1-james.hilliard1@gmail.com>
References: <20250915202737.1513190-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831403; x=1759436203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BTZ6Hv1zaX0bHXR+CmbHMZu+N5LHu1fnRYcAHI6b70=;
 b=D/VL3U1Q6I0rlxckwqpa5MSDEMRmimJsgseyByZzvcAHXBQVdzNtUGmO879EfXiw6q
 N+DStGte07xtKNeSepVIrc44iX9aoVxgVRzwfAUEguWjjfrUw8KZnYN306Anb53mhIr2
 0ByCl+xuVla8ceoIZfdDfwxe5aZaN1ibDc7i5K/GcET/6RfbZiS/0A8jwEKx3zBzwqEO
 SwUgnBlm7L/thQG820alXEeVNt04LVGkNjQOjchFwOj3/WxdIFo0KHDx0SuhzM5d4hIW
 L2s2IBgc3lVCTOMnYVgTZOuefqP/gkINwo8YETJymlXT1z7MoIgOBm8QWkqZ+luZPfvb
 eGuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D/VL3U1Q
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: remove python six module
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> We dropped support for python2 a while back, as such we can remove
> the python six module which was only needed for backwards
> comaptibility with python2.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  utils/scanpypi | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index af62c01632..61879e39d4 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -22,16 +22,10 @@ import tempfile
>  import traceback
>  import importlib
>  import importlib.metadata
> -import six.moves.urllib.request
> -import six.moves.urllib.error
> -import six.moves.urllib.parse
> -from six.moves import map
> -from six.moves import zip
> -from six.moves import input
> -if six.PY2:
> -    import StringIO
> -else:
> -    import io
> +import urllib.request
> +import urllib.error
> +import urllib.parse
> +import io
>  
>  BUF_SIZE = 65536
>  
> @@ -225,15 +219,15 @@ class BuildrootPackage():
>          self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
>              pkg=self.real_name)
>          try:
> -            pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
> -        except six.moves.urllib.error.HTTPError as error:
> +            pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
> +        except urllib.error.HTTPError as error:
>              print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
>              print('ERROR: Could not find package {pkg}.\n'
>                    'Check syntax inside the python package index:\n'
>                    'https://pypi.python.org/pypi/ '
>                    .format(pkg=self.real_name))
>              raise
> -        except six.moves.urllib.error.URLError:
> +        except urllib.error.URLError:
>              print('ERROR: Could not find package {pkg}.\n'
>                    'Check syntax inside the python package index:\n'
>                    'https://pypi.python.org/pypi/ '
> @@ -260,7 +254,7 @@ class BuildrootPackage():
>                  'digests': None}]
>              # In this case, we can't get the name of the downloaded file
>              # from the pypi api, so we need to find it, this should work
> -            urlpath = six.moves.urllib.parse.urlparse(
> +            urlpath = urllib.parse.urlparse(
>                  self.metadata['info']['download_url']).path
>              # urlparse().path give something like
>              # /path/to/file-version.tar.gz
> @@ -272,8 +266,8 @@ class BuildrootPackage():
>              try:
>                  print('Downloading package {pkg} from {url}...'.format(
>                      pkg=self.real_name, url=download_url['url']))
> -                download = six.moves.urllib.request.urlopen(download_url['url'])
> -            except six.moves.urllib.error.HTTPError as http_error:
> +                download = urllib.request.urlopen(download_url['url'])
> +            except urllib.error.HTTPError as http_error:
>                  download = http_error
>              else:
>                  self.used_url = download_url
> @@ -288,7 +282,7 @@ class BuildrootPackage():
>              raise DownloadFailed('Failed to download package {pkg}: '
>                                   'No source archive available'
>                                   .format(pkg=self.real_name))
> -        elif download.__class__ == six.moves.urllib.error.HTTPError:
> +        elif download.__class__ == urllib.error.HTTPError:
>              raise download
>  
>          self.filename = self.used_url['filename']
> @@ -317,10 +311,7 @@ class BuildrootPackage():
>          Keyword arguments:
>          tmp_path -- directory where you want the package to be extracted
>          """
> -        if six.PY2:
> -            as_file = StringIO.StringIO(self.as_string)
> -        else:
> -            as_file = io.BytesIO(self.as_string)
> +        as_file = io.BytesIO(self.as_string)
>          if self.filename[-3:] == 'zip':
>              with zipfile.ZipFile(as_file) as as_zipfile:
>                  tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
> @@ -797,12 +788,12 @@ def main():
>              print('Fetching package', package.real_name)
>              try:
>                  package.fetch_package_info()
> -            except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
> +            except (urllib.error.URLError, urllib.error.HTTPError):
>                  continue
>  
>              try:
>                  package.download_package()
> -            except six.moves.urllib.error.HTTPError as error:
> +            except urllib.error.HTTPError as error:
>                  print('Error: {code} {reason}'.format(code=error.code,
>                                                        reason=error.reason))
>                  print('Error downloading package :', package.buildroot_name)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
