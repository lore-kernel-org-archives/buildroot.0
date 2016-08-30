From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 23:37:33 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple
 trees at once (branch yem/multi-br2-external-ID-7)
In-Reply-To: <cover.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-07-16 12:34, Yann E. MORIN wrote:
> Therefore, br2-external trees must now use $(BR2_EXTERNAL_$(MY_ID)) to
> refer to their own files. It also prevent them from (accidentally)
> including files from other br2-external trees.
> 
> Note: IDs are optional, so that existing br2-external trees continue to
> work as before. However, if a br2-external tree does not provide an ID,
> it will not be useable in conjunction with other br2-external trees.
> Using multiple br2-external trees mandates that all of them provide an
> ID.

 A general remark on the series: I don't think it's worthwhile to keep
supporting the existing single BR2_EXTERNAL without external.name.

 First of all, an external tree is a somewhat advanced option. It exposes an
important amount of "internal API". So it is to be expected that you need to do
_something_ with it when you upgrade buildroot.

 And indeed, when you have external packages, you do have to deal with changes
in buildroot internals, e.g. the removal of host package dependency
auto-derivation. We don't have legacy handling for these internals.

 And to top it off, it's really easy to update:
- If you don't update, you get a nice error message
  '/path/to/foo' has no NAME (in file 'external.name')
- You only have to do two things:
  * Create external.name.
  * Run 'find . -type f | xargs sed -i s/BR2_EXTERNAL/BR2_EXTERNAL_FOO_PATH/g'

 Supporting the old single-external without name in parallel with the new named
approach takes a significant amount of code - I estimate about 40 lines, out of
285 lines affected by this patch set...

 So, I repeat: I think the backward compatibility should be dropped here.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
