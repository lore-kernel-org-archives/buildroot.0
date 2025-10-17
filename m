Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A212CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5005540B85;
	Fri, 17 Oct 2025 15:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mA4yAzixVNSg; Fri, 17 Oct 2025 15:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 506EC40B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506EC40B91;
	Fri, 17 Oct 2025 15:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29257972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 15:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A8C640B91;
 Fri, 17 Oct 2025 15:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w29L-P43VPk3; Fri, 17 Oct 2025 15:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8012440B7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8012440B7A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8012440B7A
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 15:09:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-471131d6121so16248755e9.1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760713741; x=1761318541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kz33wJQxUzurcTzVC/AtZRl+ik/XN6eZuUE2rgmIl48=;
 b=GGCpFiJUf8LknG4Yrr7W3qMYAhQFm2jAFpW7lQhVU7QuxTZsStRiGhLjhJx//mlV/t
 TsgTqW6beOm8QPE1rpeZYqJcwGBs6kNoZS2bVR6bEj90RCeZhMW/3iJM2TLCo0FWWbPh
 j4lOKhY3oYMajpWuXTUgKm1kifaKl0cK600xvh59qPUcIro311MqZWZzy4Ac2WCryQKF
 neBRAXtuGU1Sz2WB2r/D+VW8cmJEMTH7r4+NW2YReGs2xNiRFgqMLQX2f1SZTk+IornK
 BPfU8mFsBHEQvDhUWAo5DJgDYGh+mwU+eRABlivyPFhElQjY3ZiGrOiCw8eFkWeYAFY1
 EHuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURP7VpkIPOSQrHGz0Zd2XzhauKcF1s/uEFOFDhl8z9jEoCJ1AdElRMb9ZV/8lnv6ATe51aLedkpIo=@buildroot.org
X-Gm-Message-State: AOJu0YzoRMFtdleauUESwojs96orhQcVLrsLxpIOnGDGOSyJwXyNOmLL
 6J6g6h+Zv1O5+Ax5CA/HNltzHBBVpbG5BcrQDcHtKLAfJfB23iYAwXDtfGMx/A==
X-Gm-Gg: ASbGnctrCknpO31w8yJ/xXYOZ6EWh5eNiMhrLwfp1jWoT6z15Vrr7ObITZ48Axica+g
 D79jKDOhSjtn5FBjMF+UCPRdytJ8/t8Q+4ByxVjVm35zKvCFhMGn817Ktz73GVEtyrtvlbbfqd4
 Gg/XzuDEOsjcF2Qm9pfnFCWfujWcZDDsHk5sIRw4PlV2JYx5jjWIbSTCL7J7Y+fK41ZBKfBFwP6
 nFu00rdgR8HD9BnBxmzAuzNGgWWRGx3gCYik3/E6VvoMFlCOaNcobKqjJAohvPcTNB9Jr6ZavL+
 1tF/w+V4C6//mcnH3JiIbvPL4RpwXIz5jIDQ1OLno+MnxY05TaZqhbTT0hWVZTAh5mpgF1o7J7M
 a5NlzX8z54Fux221E3Kv/MI0Ip5JJ/V+vJ87Px0yvEUBZXDK1r6ynr2i7zro1SK++Kaqi2X3MhC
 2CFwO5agZJb7OAdVmOwSSrhg==
X-Google-Smtp-Source: AGHT+IEGEi3O8Y5yhE5aXpzkC99rYq4QFcteI5IqrS1nMOMLlr6MZlDoiIbJKjMRTrTjepZY1AMyLA==
X-Received: by 2002:a05:600c:3e8f:b0:46f:a95d:e9e7 with SMTP id
 5b1f17b1804b1-471177ab11dmr34113355e9.0.1760713741040; 
 Fri, 17 Oct 2025 08:09:01 -0700 (PDT)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444d919sm87745725e9.14.2025.10.17.08.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 08:09:00 -0700 (PDT)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Oct 2025 17:08:58 +0200
Date: Fri, 17 Oct 2025 17:08:58 +0200
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Message-ID: <aPJcClk0P9W0x9ju@landeda>
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <a4c335e6-b2e3-487d-b6d8-60318059b195@bubu1.eu>
 <aPJVOlZTJvdk65L8@debian>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YLggH2r2TXVd1kCN"
Content-Disposition: inline
In-Reply-To: <aPJVOlZTJvdk65L8@debian>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760713741; x=1761318541; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kz33wJQxUzurcTzVC/AtZRl+ik/XN6eZuUE2rgmIl48=;
 b=F3P1KrFnx0pJcRRMaGA3/oPqVtEJi9iVHiiw46IlW5wUUWTSHz8oW9EmkAScAjIMCZ
 x9UGxfozM7j6GQ8MoFmQiqFsTXyhw1gvFzYAHQdVlN43V61xumkGCi1yBatdUiNm++4K
 Fo7CnXhDA6EarjRJT0pM59eWgSAyJgqcib61YN0tQDAVu/d0+eahG3+q9LNYFfCc7sYW
 h2wQxwAahfFW8y8EopYaK5x+2ZrQwhPfFyE8GSLDwo28nvyruITnnfLjQa4kat2KcNr7
 HtjClhxoHtR2RovekWpNu2f/vF5ShTYW+Xo5sWr5P+qy+ThP+OLvTrEaxiHg68jcUsTc
 cFxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F3P1KrFn
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--YLggH2r2TXVd1kCN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Vincent, Marcus, All,

On 2025-10-17 16:39 +0200, Vincent Stehl=C3=A9 spake thusly:
> On Fri, Oct 17, 2025 at 04:12:34PM +0200, Marcus Hoffmann wrote:
> > I have seen the following thing happen once during a CI run, where 2 of=
 the
> > lines where truncated in the middle of the timestamp. I have looked thr=
ough
> > a bunch of build logs now but haven't seen this again, so not sure if t=
hat's
> > an actual problem we need to care about
[--SNIP--]
> > And secondly, also in CI:
> > The "Done in Xmin Ys" text that is printed in the end is still always
> > displayed in the middle of a line during the end of the build output:
> >=20
> > 2025-10-17T08:52:28 >>> owfs 3.2p4 Installing to staging directory
> > 2025-10-17T08:52:29 >>> owfs 3.2p4 Fixing libtool fDone in 7min 37s
> > iles
> > 2025-10-17T08:52:30 >>> owfs 3.2p4 Installing to target
> > 2025-10-17T08:52:38 >>> python-pydantic-core 2.33.2 Installing to target
> > 2025-10-17T08:52:52 >>> e2fsprogs 1.47.2 Building
> > [...]
[--SNIP--]
> What you described is a valid reason I think to add the --unbuffered argu=
ment to
> sed; I will respin a v2.

For what it's worth, I've locally extensively tweaked and almost
rewritten brmake over the years since I initially submitted the original
one, and which addresses all the issues I've seen mentionned in this
thread (but I only skimmed over0.

Basically, it inverses the filtering and the tee, tee-ing before
filtering. It also uses a bash coproc to beter catch-and-terminate the
process in case of Ctrl-C (but it is not 100% perfect).

The most important thing is that is forces -Otarget (unless -O was
already specified on the command line) to group per-target output and
avoid mixing output of multiple recipes.

It got quite a bit more complex, of course, but hey... :-]

With this, I can no longer observe any mangled or mixed-up line.

Feel free to properly submit it if you like it better. ;-)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

--=20
=2E-----------------.--------------------.------------------.--------------=
------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'

--YLggH2r2TXVd1kCN
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=brmake

#!/bin/bash

trap_ctrl-c() {
    if [ -n "${MAKE_PID}" ]; then
        printf '\rInterrupted, waiting for jobs to finish...\n' >&6
        kill -INT ${MAKE_PID}
        wait ${MAKE_PID}
        exit ${?}
    fi
}

disp_time() {
    local start="${1}"
    local S h m s

    if [ "${BRMAKE_ABS_TIME}" ]; then
        printf '%(%T)T' -1
    else
        S=$((${EPOCHSECONDS:-$(date +%s)}-start))
        h=$((S/3600))
        m=$(((S%3600)/60))
        s=$((S%60))
        [ "${h}" -eq 0 ] || printf '%d:' "${h}"
        printf '%02d:%02d' "${m}" "${s}"
    fi
}

main() {
    local ret start dir_found dir O log_file outsync

    start=${BR_START:-${EPOCHSECONDS:-$(date +%s)}}

    # Crude parsing to find the directory with the .config
    dir="$(pwd)"
    dir_found=false
    outsync=-Otarget
    for i in "${@}"; do
        ${dir_found} && { dir="${i}"; dir_found=false; continue; }
        case "${i}" in
        (-C|--directory)    dir_found=true;;
        (-C*)               dir="${i#-C}";;
        (--directory=*)     dir="${i#--directory=}";;
        (O=*)               O="${i#O=}";;
        (-O|-O*)            outsync=;;
        esac
    done

    if [ -n "${O}" -a -e "${O}/.config" ]; then
        log_file="${O}/br.log"
    elif [ -z "${O}" -a -e "${dir}/.config" ]; then
        log_file="${dir}/br.log"
    else
        # No .config, don't log, and let Buildroot do its magic (i.e., whine)
        exec make "${@}"
    fi

    {   coproc LOGGER \
        {
            printf '\r%s' "$(disp_time "${start}")"
            IFS="${CR}"
            tee -a "${log_file}" \
            |sed -u -r -e '/^.{4}(>>> .+)/!d; s//\1/' \
            |while true; do
                if read -r -t 0.25 line; then
                    printf '\r%s %s%s%s\n' \
                        "$(disp_time "${start}")" \
                        "${BRMAKE_PREFIX:+${BRMAKE_PREFIX} }" \
                        "${prev}" \
                        "${line}"
                    disp_time "${start}"
                    prev=""
                elif [ ${?} -gt 128 ]; then
                    prev="${prev}${line}"
                    printf '\r%s' "$(disp_time "${start}")"
                else
                    break
                fi
            done
            exit 0
        } >&3
    } 3>&1

    trap trap_ctrl-c INT

    exec 5>&1 16>&1 6>&2 >&${LOGGER[1]} 2>&1 4>&1
    exec 16>&-
    ${MAKE:-make} ${outsync} "${@}" 2>&1 &
    MAKE_PID="${!}"
    wait ${MAKE_PID}
    ret="${?}"
    MAKE_PID=""
    exec >&5 2>&6 4>&-

    # bash seems to have issues closing an fd when it is an indexed-array
    # expansion, while it has no problem opening it (see above).
    eval exec "${LOGGER[1]}>&-"
    wait ${LOGGER_PID}

    printf '\r%s %s>>> ' "$(disp_time "${start}")" "${BRMAKE_PREFIX:+${BRMAKE_PREFIX} }"
    if [ "${BRMAKE_ABS_TIME}" ]; then
        printf 'Done in %s' "$(BRMAKE_ABS_TIME= disp_time "${start}")"
    else
        printf 'Finished at %(%T)T' -1
    fi
    if [ ${ret} -ne 0 ]; then
        printf ' (error %d)' ${ret}
    fi
    printf '\n'

    return ${ret}
}

CR="
"

main "${@}"

--YLggH2r2TXVd1kCN
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--YLggH2r2TXVd1kCN--
