Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F80BC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8670405E6;
	Wed, 30 Aug 2023 21:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8670405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JexdDiVHk5Eb; Wed, 30 Aug 2023 21:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF7B417F7;
	Wed, 30 Aug 2023 21:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF7B417F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCDAC1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E7B417DF
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E7B417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiQEs-zp8Wt2 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:37:56 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BC07405E6
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC07405E6
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9a2185bd83cso11265466b.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 14:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693431474; x=1694036274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4NO1y1n74D+QJjDVGsHQdfmJ2gz39QBnYEQcAO4HEi0=;
 b=Gp4zE3k+39H0cSCNPFTvl0LQXK65Fj7zUD4/I3plhP5nHW5eyhOzItOxV8O++H95h1
 IRR+B4AKC48Vp6ljkhq0ajDR9jlKxlGtCcQIOyLVZBDtiTqcKHL1aJGLGCacsQoSx3lH
 OQer6jF1Ibr8IBAGyHaYGIvg1J66ku/1NN0AZ6+1zpMyp5GLvX3MzVpSjhPfhLpYdQAA
 fKymC6Ka//rFT5EHzHw+1d7xbi3H5tl0imQXECFo9s5W6nkUMlRJRqgR/28iOO9ChfVV
 bV31YxIdFZ5e8tLAsxEJG+XIf45qHTlwIb3RAvu5eHEgkna1k8FMiWJAdXniS6bxRjUp
 /fkg==
X-Gm-Message-State: AOJu0YzOcWnvoyCftYmMtNWsa0ZZBqEu3yJTTsz745e28f5ZsL8iROKT
 Ryy+N11ROVw4DWzt4NPVrM7J+A==
X-Google-Smtp-Source: AGHT+IHj5wFu8c1iS31XtT19MpSZ1chMenlkwsrBk28TPyKJzfZ3dx5Dmt486sKUpJbJs8bNqR9JLA==
X-Received: by 2002:a17:907:2cd7:b0:9a1:c502:b7d2 with SMTP id
 hg23-20020a1709072cd700b009a1c502b7d2mr2386152ejc.67.1693431473943; 
 Wed, 30 Aug 2023 14:37:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a170906529900b00993a9a951fasm16400ejm.11.2023.08.30.14.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 14:37:53 -0700 (PDT)
Message-ID: <da055153-9ec6-ade2-46ee-49c2d33ebf36@mind.be>
Date: Wed, 30 Aug 2023 23:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-5-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-5-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693431474; x=1694036274; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4NO1y1n74D+QJjDVGsHQdfmJ2gz39QBnYEQcAO4HEi0=;
 b=CaxtfTMJblwNRibyHVteWQjdkqvPSztnBLAYAvj74txt9Q33LFZqdhsgsunJoAWSNb
 1gJMlHuCe4jOUmu4eA03XfhekiWRZ7l13LeN0KY1ni7JVmCI4CoDG3XnenzJK4OcSRcC
 aBl2tq6VaZsfXJ1eXuXuegguXTW8A+hx1bfEle3atKK8ZITvTfz8jAQnkHhtwDEJBs20
 2G8L2sYX2GMbCWRmuELYLkVQM0IOs5IrFs3nwpWDU6EysdKf5TEnxgOAtmo0WwM+hwSQ
 gRTaEnKMuTnMH7ni4nDO+sE/cdOj/IlpY4utpx3H+Y8NeFzsd+hwkQ3DaxUJAqaQ9/Gw
 Fd9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CaxtfTMJ
Subject: Re: [Buildroot] [PATCH v3 5/8] support/scripts/nvd_api_v2.py: new
 helper class
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Daniel,

  Since this is new code, I'm going to give some coding style comments that 
differ a bit from existing code you see in pkg-stats.

  I may actually end up applying the patch without those coding style changes, 
because the new NVD API is more important than any coding style concerns... 
We'll see how far I get.

  This is also not a complete review of this patch because it's almost time for 
me to go to bed.

On 12/08/2023 21:28, Daniel Lang wrote:
> The current NVD data feeds used for CVE and CPE checking will be retired
> by 2023-12-05 [0]. Both have to be switched to the new v2 API. Since
> fetching data from both sources workes the same, a common base class is

  workes -> works

> used to handle the API interaction.
> To store the data locally a sqlite database is used.

  Maybe explain a bit more than the new API doesn't allow to download files 
anymore, so we need to invent our own file format for persisting it, and a 
sqlite db is a convenient format that is always available in python.

> 
> [0]: https://nvd.nist.gov/General/News/change-timeline
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>   DEVELOPERS                    |   1 +
>   support/scripts/nvd_api_v2.py | 138 ++++++++++++++++++++++++++++++++++
>   2 files changed, 139 insertions(+)
>   create mode 100755 support/scripts/nvd_api_v2.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6ffa3ee693..81f809a4c0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -668,6 +668,7 @@ F:	package/paho-mqtt-cpp/
>   F:	package/pangomm/
>   F:	package/pangomm2_46/
>   F:	package/sam-ba/
> +F:	support/scripts/nvd_api_v2.py
>   
>   N:	Damien Lanson <damien@kal-host.com>
>   F:	package/libvdpau/
> diff --git a/support/scripts/nvd_api_v2.py b/support/scripts/nvd_api_v2.py
> new file mode 100755
> index 0000000000..3fdf32596f
> --- /dev/null
> +++ b/support/scripts/nvd_api_v2.py
> @@ -0,0 +1,138 @@
> +#!/usr/bin/env python3
> +
> +from datetime import datetime, timezone
> +import os

  Personally, I think it's better to move away from the os module and use 
pathlib.Path instead everywhere a path is used. We don't do that anywhere in 
Buildroot at the moment, but I think we should.


> +import requests
> +import shutil
> +import sqlite3
> +import time
> +
> +NVD_API_VERSION = '2.0'
> +NVD_API_BASE_URL = 'https://services.nvd.nist.gov/rest/json'
> +
> +
> +class NVD_API:
> +    """
> +    A helper class that fetches data from a NVD API and
> +    helps manage a sqlite database.
> +    """
> +    def __init__(self, nvd_path, service, database_file_prefix):
> +        """
> +        Initialize a new NVD API endpoint with service
> +        as the URL postfix.

  Could you add documentation for the arguments? I was initially confused by 
nvd_path, it sounded like the path part of the URL...

> +        """
> +        self.nvd_path = nvd_path
> +        self.service = service
> +        self.url = '%s/%s/%s' % (NVD_API_BASE_URL, service.lower(), NVD_API_VERSION)

  Prefer to use format strings:

         self.url = f'{NVD_API_BASE_URL}/{service.lower()}/{NVD_API_VERSION}

> +        self.db_file = os.path.join(nvd_path, '%s-%s.sqlite' % (database_file_prefix, NVD_API_VERSION))
> +        self.db_file_tmp = '%s.tmp' % self.db_file

  I haven't looked in too much detail at how the tmp file is used, but I wonder 
if it is really needed. sqlite should be able to manage access to the database 
so that it stays consistent. If we make sure to use transactions if more than 
one row needs to be stored consistently (which I doubt is really needed anyway), 
then we should always be able to read consistent data from the database. And if 
we re-fetch information from the NVD database, then we should be able to update 
the existing row if it actually was already downloaded before.

  If I'm missing something here, please add a detailed explanation to the 
beginning of this file or class to understand why the tmp file is needed.

> +
> +    def init_db(self):
> +        """
> +        Needs to be implemented by derived classes.
> +        Used to make sure that database tables exist.
> +        """
> +        pass
> +
> +    def save_to_db(self, start_index, total_results, content):
> +        """
> +        Needs to be implemented by derived classes.
> +        Used to save the data given by a single API request
> +        to the database.
> +        """
> +        pass
> +
> +    def cleanup_db(self):

  The name of the function doesn't sound very good to me - it makes me think 
you're deleting the db file itself, not the tmp file.

> +        """
> +        Clean up any files that where left by previously
> +        failed runs.
> +        """
> +        if os.path.exists(self.db_file_tmp):
> +            os.remove(self.db_file_tmp)
> +
> +    def open_db(self, tmp=False):
> +        """
> +        Open and return a connection to the sqlite database.
> +        """
> +        if tmp:
> +            return sqlite3.connect(self.db_file_tmp)
> +        return sqlite3.connect(self.db_file)

  I think putting this in a function is making things more complicated than 
calling sqlite3.connect directly from the caller.

> +
> +    def download(self, last_update):
> +        """
> +        Download all entries from NVD since last_update (if not None).
> +        For each downloaded page save_to_db is called to together with
> +        progress information.
> +        NVD rate limiting allows 5 requests per 30 seconds or one every
> +        6 seconds.

  Could we maybe define those numbers as class variables and calculate the sleep 
etc. times that are used below based on those? Instead of having constant 5 and 6.

> +        """
> +        args = {}
> +        start_index = 0
> +        total_results = 0
> +        results_per_page = 0
> +
> +        print('Downloading new %s' % self.service)
> +
> +        if (last_update is not None):
> +            args['lastModStartDate'] = last_update.isoformat()
> +            args['lastModEndDate'] = datetime.now(tz=timezone.utc).isoformat()
> +
> +        while True:
> +            args['startIndex'] = start_index
> +
> +            for attempt in range(5):
> +                try:
> +                    page = requests.get(self.url, params=args)
> +                    page.raise_for_status()
> +                    content = page.json()
> +                except Exception:

  This will also catch unrecoverable errors, e.g. DNS lookup failures, which 
leads to an endless loop without any feedback. Would it be possible to instead 
catch the exact exception that requests raises when we hit rate limiting?

> +                    time.sleep(6)
> +                else:
> +                    break
> +
> +            if content is None:
> +                # Nothing was downloaded
> +                return False
> +
> +            results_per_page = content['resultsPerPage']
> +            total_results = content['totalResults']
> +            start_index = content['startIndex']
> +
> +            start_index += results_per_page
> +
> +            if self.save_to_db(start_index, total_results, content) is not True:

  Instead of "is not True" just do "if not self.save_to_db".

  I'm not sure what the start_index and total_results parameters are supposed to 
be used for. Are they supposed to be persisted? If yes, then IMHO this should be 
done by this class, in a separate table defined by this class.


> +                return False
> +
> +            self.connection.commit()
> +
> +            if start_index >= total_results:
> +                return True
> +
> +            # Otherwise rate limiting will be hit.
> +            time.sleep(6)

  If the rate limit really is "5 requests per 30 seconds", then we can actually 
do 3 requests back-to-back without any sleep without hitting the rate limit, 
right? Assuming you do call the script pretty regularly (like, what we do on 
a.b.o), the new results should be just a few pages, so we can avoid the sleep 
entirely...

> +
> +    def check_for_updates(self):
> +        """
> +        Check if the database file exists and if the last
> +        update was more than 24 hours ago.
> +        """
> +        self.cleanup_db()
> +        last_update = None
> +        if os.path.exists(self.db_file):
> +            last_update = os.stat(self.db_file).st_mtime

  I don't think the mtime is a reliable way to determine the last update time. 
Instead, IMHO it's better to add a table in the database that keeps track of the 
last update. This would be a table that is added by the base class itself before 
calling init_db(). After the download has completed entirely, this timestamp 
would be updated. So if it's interrupted in the middle, the next try will 
re-download with the previous timestamp. Also, the timestamp should be updated 
with the timestamp that was used in the lastModEndDate (which can be quite a bit 
earlier than the time at which the download actually finishes). Perhaps even 
subtract one second from it to make sure we don't miss any updates that were 
entered at the exact time we did the previous download.


> +            if last_update >= time.time() - 86400:
> +                return []
> +            # NVD uses UTC timestamps
> +            last_update = datetime.fromtimestamp(last_update, tz=timezone.utc)
> +            shutil.copy2(self.db_file, self.db_file_tmp)
> +
> +        self.connection = self.open_db(True)

  self.connection = None should be added to __init__ to "declare" the attribute.

  Also, db_connection would be a better name.


  Now it's time for bed :-)

  Regards,
  Arnout

> +        self.init_db()
> +
> +        success = self.download(last_update)
> +        self.connection.close()
> +        if success:
> +            shutil.move(self.db_file_tmp, self.db_file)
> +        else:
> +            print("Update failed!")
> +            os.remove(self.db_file_tmp)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
