From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Aug 2020 13:17:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-08-18
In-Reply-To: <dc83fa13-373b-2e42-ecde-da1e9741fa50@ideasonboard.com>
References: <5f3cda7b.1c69fb81.e5841.2292SMTPIN_ADDED_MISSING@mx.google.com>
 <1af22d4f-2280-749b-351a-819d245251c5@ideasonboard.com>
 <a40c1a30-520a-4d98-b3eb-a96141a26dbe@mind.be>
 <dc83fa13-373b-2e42-ecde-da1e9741fa50@ideasonboard.com>
Message-ID: <23cc9965-c376-4422-4648-ccca1d1a10b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/08/2020 11:08, Kieran Bingham wrote:
> 	enum ControlType   type_:8;                      /*     0: 0  4 */
> 	/* Bitfield combined with next fields */
> 	bool                       isArray_;             /*     1     1 */
> 	/* Bitfield combined with previous fields */
> 	size_t                     numElements_:32;      /*     0:16  8 */

 So this one is in fact unaligned? Did you never encounter a runtime error on
machines that don't allow unaligned access? Or perhaps gcc generates a different
layout in that case, with the hole before numElements instead of after it...

> 	/* XXX 16 bits hole, try to pack */
> 	union {
> 		uint64_t           value_;               /*     8     8 */
> 		void *             storage_;             /*     8     8 */
> 	};                                               /*     8     8 */

 Having a layout like this in a struct that is ABI is asking for trouble IMO,
because some compile options (e.g. -fpack-struct) will change it. I think you
should add padding fields to make sure alignment is exactly as you expect, and
also give the bool member an explicit size (i.e. make it a bitfield too). The
unaligned field is bad news IMO, but changing that is an ABI change...

 Regards,
 Arnout
