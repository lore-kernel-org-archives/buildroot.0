From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 14:55:00 -0300
Subject: [Buildroot] [PATCHv2] argus: bump to vanilla version 3.6.0.1
Message-ID: <1403027700-14160-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of the new toolchain requirements (ipv6, threads, rpc) aren't
actually new - this package failed to build for ages, it just wasn't
picked up by the autobuilders because the main Makefile just doesn't
care about bailing out properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/argus/Config.in                            |    7 +
 package/argus/argus-0001-drop-susv3-legacy.patch   | 1460 ++++++++++++++++++++
 .../argus/argus-3.0.0.rc.34-00-susv3-legacy.patch  | 1278 -----------------
 .../argus-3.0.0.rc.34-01-use-pcap-header.patch     |   27 -
 package/argus/argus.mk                             |   23 +-
 5 files changed, 1478 insertions(+), 1317 deletions(-)
 create mode 100644 package/argus/argus-0001-drop-susv3-legacy.patch
 delete mode 100644 package/argus/argus-3.0.0.rc.34-00-susv3-legacy.patch
 delete mode 100644 package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch

diff --git a/package/argus/Config.in b/package/argus/Config.in
index 6728ae7..fe28c77 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,7 +1,14 @@
 config BR2_PACKAGE_ARGUS
 	bool "argus"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  A Real Time Flow Monitor-based audit engine.
 
 	  http://qosient.com/argus/
+
+comment "argus needs a toolchain w/ threads, IPv6"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6)
diff --git a/package/argus/argus-0001-drop-susv3-legacy.patch b/package/argus/argus-0001-drop-susv3-legacy.patch
new file mode 100644
index 0000000..6ab22a6
--- /dev/null
+++ b/package/argus/argus-0001-drop-susv3-legacy.patch
@@ -0,0 +1,1460 @@
+Switch from SUSv3 deprecated bcopy/bzero to memcpy/memset.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura argus-3.0.6.1.orig/argus/Argus802.11.c argus-3.0.6.1/argus/Argus802.11.c
+--- argus-3.0.6.1.orig/argus/Argus802.11.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/Argus802.11.c	2014-06-17 11:23:00.387431286 -0300
+@@ -61,7 +61,7 @@
+ 
+    u_char *p = (u_char *) ptr + hdrlen;
+ 
+-   bzero(&pbody, sizeof(pbody));
++   memset(&pbody, 0, sizeof(pbody));
+ 
+    switch (FC_TYPE(fc)) {
+       case T_MGMT: {
+@@ -151,9 +151,9 @@
+       retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_WLAN;
+       retn->hdr.argus_dsrvl8.len  = (sizeof(struct ArgusWlanFlow) + 3)/4 + 1;
+ 
+-      bcopy ((char *)&hp->da,    (char *)&model->ArgusThisFlow->wlan_flow.dhost, ETH_ALEN);
+-      bcopy ((char *)&hp->sa,    (char *)&model->ArgusThisFlow->wlan_flow.shost, ETH_ALEN);
+-      bcopy ((char *)&hp->bssid, (char *)&model->ArgusThisFlow->wlan_flow.bssid, ETH_ALEN);
++      memcpy((char *)&hp->da, (char *)&model->ArgusThisFlow->wlan_flow.dhost, ETH_ALEN);
++      memcpy((char *)&hp->sa, (char *)&model->ArgusThisFlow->wlan_flow.shost, ETH_ALEN);
++      memcpy((char *)&hp->bssid, (char *)&model->ArgusThisFlow->wlan_flow.bssid, ETH_ALEN);
+ 
+       switch (FC_TYPE(fc)) {
+          case T_MGMT: {
+@@ -166,7 +166,7 @@
+                case ST_PROBE_RESPONSE:
+                case ST_BEACON: {
+                   if (pbody.ssid_status == PRESENT) {
+-                     bcopy((char *)pbody.ssid.ssid, model->ArgusThisFlow->wlan_flow.ssid, pbody.ssid.length);
++                     memcpy((char *)pbody.ssid.ssid, model->ArgusThisFlow->wlan_flow.ssid, pbody.ssid.length);
+                   }
+                   break;
+                }
+diff -Nura argus-3.0.6.1.orig/argus/ArgusApp.c argus-3.0.6.1/argus/ArgusApp.c
+--- argus-3.0.6.1.orig/argus/ArgusApp.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusApp.c	2014-06-17 11:23:00.412432131 -0300
+@@ -213,9 +213,9 @@
+                                           net->hdr.argus_dsrvl8.qual = 0;
+                                           net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusRTCPObject) + 3)/4) + 1;
+                                           if (model->ArgusThisDir) {
+-                                             bcopy ((char *) rtcp, (char *)&rtcpObject->src, sizeof(*rtcp));
++                                             memcpy((char *) rtcp, (char *)&rtcpObject->src, sizeof(*rtcp));
+                                           } else {
+-                                             bcopy ((char *) rtcp, (char *)&rtcpObject->dst, sizeof(*rtcp));
++                                             memcpy((char *) rtcp, (char *)&rtcpObject->dst, sizeof(*rtcp));
+                                           }
+ 
+                                        } else {
+@@ -229,15 +229,15 @@
+                                              net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusRTPObject) + 3)/4) + 1;
+ 
+ 
+-                                             bcopy(rtp, trtp, sizeof(*trtp));
++                                             memcpy(rtp, trtp, sizeof(*trtp));
+                                              trtp->rh_seq  = ntohs(rtp->rh_seq);
+                                              trtp->rh_time = ntohl(rtp->rh_time);
+                                              trtp->rh_ssrc = ntohl(rtp->rh_ssrc);
+ 
+                                              if (model->ArgusThisDir) {
+-                                                bcopy ((char *) trtp, (char *)&rtpObject->src, sizeof(*rtp));
++                                                memcpy((char *) trtp, (char *)&rtpObject->src, sizeof(*rtp));
+                                              } else {
+-                                                bcopy ((char *) trtp, (char *)&rtpObject->dst, sizeof(*rtp));
++                                                memcpy((char *) trtp, (char *)&rtpObject->dst, sizeof(*rtp));
+                                              }
+                                           }
+                                        }
+@@ -258,7 +258,7 @@
+ 
+                                              if (ArgusThisUdtHshake != NULL) {
+                                                 struct ArgusUDTObject *udtObject = (struct ArgusUDTObject *)(&net->hdr + 1);
+-                                                bcopy (ArgusThisUdtHshake, &udtObject->hshake, sizeof(*ArgusThisUdtHshake));
++                                                memcpy(ArgusThisUdtHshake, &udtObject->hshake, sizeof(*ArgusThisUdtHshake));
+                                              }
+                                           }
+                                        }
+@@ -350,7 +350,7 @@
+ 
+                   if ((bytes = model->ArgusThisSnapEnd - model->ArgusThisUpHdr) > 0) {
+                      thislen = (thislen > bytes) ? bytes : thislen;
+-                     bcopy (model->ArgusThisUpHdr, &((char *)&user->array)[user->count], thislen);
++                     memcpy(model->ArgusThisUpHdr, &((char *)&user->array)[user->count], thislen);
+                      user->count += thislen;
+                   }
+                }
+@@ -392,7 +392,7 @@
+          struct rtphdr trtpbuf, *trtp = &trtpbuf;
+          struct rtphdr *ArgusThisRtpHdr = NULL;
+ 
+-         bcopy(rtp, trtp, sizeof(*trtp));
++         memcpy(rtp, trtp, sizeof(*trtp));
+          trtp->rh_seq  = ntohs(rtp->rh_seq);
+          trtp->rh_time = ntohl(rtp->rh_time);
+          trtp->rh_ssrc = ntohl(rtp->rh_ssrc);
+@@ -404,7 +404,7 @@
+ 
+          if (!(ArgusThisRtpHdr->rh_seq)) {
+             if (rtp->rh_ver == 2) 
+-               bcopy ((char *) trtp, (char *)ArgusThisRtpHdr, sizeof(*rtp));
++               memcpy((char *) trtp, (char *)ArgusThisRtpHdr, sizeof(*rtp));
+          } else {
+             if (rtp->rh_ver == 2) {
+             if (!(trtp->rh_ssrc) || (ArgusThisRtpHdr->rh_ssrc != trtp->rh_ssrc))
+@@ -446,7 +446,7 @@
+                   }
+                }
+     
+-               bcopy ((char *) trtp, (char *) ArgusThisRtpHdr, sizeof(*rtp));
++               memcpy((char *) trtp, (char *) ArgusThisRtpHdr, sizeof(*rtp));
+          
+                if (offset < model->ArgusThisLength) {
+                model->ArgusThisUpHdr = (unsigned char *)(rtp + 1) + offset;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusArp.c argus-3.0.6.1/argus/ArgusArp.c
+--- argus-3.0.6.1.orig/argus/ArgusArp.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusArp.c	2014-06-17 11:23:00.391431421 -0300
+@@ -151,8 +151,8 @@
+             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_ARP;
+ 
+             if (PLN(ahdr) == sizeof(arp_spa)) {
+-               bcopy (SPA(ahdr), &arp_spa, sizeof(arp_spa));
+-               bcopy (TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
++               memcpy(SPA(ahdr), &arp_spa, sizeof(arp_spa));
++               memcpy(TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
+ 
+ #ifdef _LITTLE_ENDIAN
+                arp_spa = ntohl(arp_spa);
+@@ -170,7 +170,7 @@
+                retn->arp_flow.arp_tpa = arp_tpa;
+                retn->arp_flow.arp_spa = arp_spa;
+ 
+-               bcopy (SHA(ahdr), (char *)&retn->arp_flow.haddr, HLN(ahdr));
++               memcpy(SHA(ahdr), (char *)&retn->arp_flow.haddr, HLN(ahdr));
+             }
+             break;
+          }
+@@ -180,8 +180,8 @@
+             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_ARP;
+ 
+             if (PLN(ahdr) == sizeof(arp_spa)) {
+-               bcopy (SPA(ahdr), &arp_spa, sizeof(arp_spa));
+-               bcopy (TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
++               memcpy(SPA(ahdr), &arp_spa, sizeof(arp_spa));
++               memcpy(TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
+ 
+ #ifdef _LITTLE_ENDIAN
+                arp_spa = ntohl(arp_spa);
+@@ -199,7 +199,7 @@
+                retn->arp_flow.arp_tpa = arp_spa;
+                retn->arp_flow.arp_spa = arp_tpa;
+    
+-               bcopy (THA(ahdr), (char *)&retn->arp_flow.haddr, HLN(ahdr));
++               memcpy(THA(ahdr), (char *)&retn->arp_flow.haddr, HLN(ahdr));
+             }
+             break;
+          }
+@@ -217,15 +217,15 @@
+             retn->rarp_flow.pln     = PLN(ahdr);
+             retn->rarp_flow.op      =  OP(ahdr);
+ 
+-            bcopy (THA(ahdr), &retn->rarp_flow.shaddr, HLN(ahdr));
+-            bcopy (SHA(ahdr), &retn->rarp_flow.dhaddr, HLN(ahdr));
++            memcpy(THA(ahdr), &retn->rarp_flow.shaddr, HLN(ahdr));
++            memcpy(SHA(ahdr), &retn->rarp_flow.dhaddr, HLN(ahdr));
+             break;
+          }
+ 
+          case REVARP_REPLY: {
+             retn->hdr.argus_dsrvl8.len  = sizeof(struct ArgusRarpFlow)/4 + 1;
+             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_RARP;
+-            bcopy (TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
++            memcpy(TPA(ahdr), &arp_tpa, sizeof(arp_tpa));
+ 
+ #ifdef _LITTLE_ENDIAN
+             arp_tpa = ntohl(arp_tpa);
+@@ -236,9 +236,9 @@
+             retn->rarp_flow.pln     = PLN(ahdr);
+             retn->rarp_flow.op      = REVARP_REQUEST;
+ 
+-            bcopy ((char *)&arp_tpa, &retn->rarp_flow.arp_tpa, sizeof(arp_tpa));
+-            bcopy (SHA(ahdr), &retn->rarp_flow.shaddr, HLN(ahdr));
+-            bcopy (THA(ahdr), &retn->rarp_flow.dhaddr, HLN(ahdr));
++            memcpy((char *)&arp_tpa, &retn->rarp_flow.arp_tpa, sizeof(arp_tpa));
++            memcpy(SHA(ahdr), &retn->rarp_flow.shaddr, HLN(ahdr));
++            memcpy(THA(ahdr), &retn->rarp_flow.dhaddr, HLN(ahdr));
+             break;
+          }
+       }
+@@ -315,7 +315,7 @@
+ 
+             arpobj = &net->net_union.arp;
+ 
+-            bcopy ((unsigned char *)SHA(ahdr), arpobj->respaddr, 6);
++            memcpy((unsigned char *)SHA(ahdr), arpobj->respaddr, 6);
+             break;
+          }
+       }
+diff -Nura argus-3.0.6.1.orig/argus/argus.c argus-3.0.6.1/argus/argus.c
+--- argus-3.0.6.1.orig/argus/argus.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/argus.c	2014-06-17 11:23:00.385431218 -0300
+@@ -299,7 +299,7 @@
+ #if defined(HAVE_STRLCPY)
+       strlcpy(path, argv[0], MAXPATHNAMELEN - 1);
+ #else
+-      bzero(path, MAXPATHNAMELEN);
++      memset(path, 0, MAXPATHNAMELEN);
+       strncpy(path, argv[0], MAXPATHNAMELEN - 1);
+ #endif
+       argv[0] = strrchr(argv[0], '/') + 1;
+@@ -700,7 +700,7 @@
+ 
+    char *ArgusIntStr[ARGUS_MAXINTERFACE];
+ 
+-   bzero(ArgusIntStr, sizeof(ArgusIntStr));
++   memset(ArgusIntStr, 0, sizeof(ArgusIntStr));
+ #endif
+ 
+ #if defined(ARGUSPERFMETRICS)
+@@ -717,7 +717,7 @@
+    if (ArgusSourceTask->ArgusStartTime.tv_sec == 0)
+       ArgusSourceTask->ArgusStartTime = ArgusSourceTask->ArgusEndTime;
+ 
+-   bzero(buf, sizeof(buf));
++   memset(buf, 0, sizeof(buf));
+ 
+    timediff.tv_sec  = ArgusSourceTask->ArgusEndTime.tv_sec  - ArgusSourceTask->ArgusStartTime.tv_sec;
+    timediff.tv_usec = ArgusSourceTask->ArgusEndTime.tv_usec - ArgusSourceTask->ArgusStartTime.tv_usec;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusEsp.c argus-3.0.6.1/argus/ArgusEsp.c
+--- argus-3.0.6.1.orig/argus/ArgusEsp.c	2014-06-17 11:21:13.098802153 -0300
++++ argus-3.0.6.1/argus/ArgusEsp.c	2014-06-17 11:23:00.432432808 -0300
+@@ -128,7 +128,7 @@
+ 
+          flowstr->dsrs[ARGUS_NETWORK_INDEX] = (void *) net;
+ 
+-         bzero ((char *)espObj, sizeof(*espObj));
++         memset((char *)espObj, 0, sizeof(*espObj));
+          flowstr->timeout = ARGUS_IPTIMEOUT;
+ 
+          espObj->spi     = esp->spi;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusEvents.c argus-3.0.6.1/argus/ArgusEvents.c
+--- argus-3.0.6.1.orig/argus/ArgusEvents.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusEvents.c	2014-06-17 11:23:00.431432774 -0300
+@@ -442,11 +442,11 @@
+       if ((retn->dsrs[ARGUS_SRCUSERDATA_INDEX] = ArgusCalloc(1, len * 4)) == NULL)
+          ArgusLog (LOG_ERR, "ArgusGenerateEventRecord() ArgusCalloc error %s\n", strerror(errno));
+ 
+-      bcopy((char *)data, (char *)retn->dsrs[ARGUS_SRCUSERDATA_INDEX], len * 4);
++      memcpy((char *)data, (char *)retn->dsrs[ARGUS_SRCUSERDATA_INDEX], len * 4);
+       retn->dsrindex |= 1 << ARGUS_SRCUSERDATA_INDEX;
+ 
+       retn->hdr.len = tlen;
+-      bcopy((char *)&retn->hdr, &rec->hdr, sizeof(rec->hdr));
++      memcpy((char *)&retn->hdr, &rec->hdr, sizeof(rec->hdr));
+ 
+ #ifdef ARGUSDEBUG
+       ArgusDebug (3, "ArgusGenerateEventRecord(%s:%s) retn 0x%x cnt %d ocnt %d", evt->method, evt->filename, retn, cnt, ocnt);
+diff -Nura argus-3.0.6.1.orig/argus/ArgusFrag.c argus-3.0.6.1/argus/ArgusFrag.c
+--- argus-3.0.6.1.orig/argus/ArgusFrag.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusFrag.c	2014-06-17 11:23:00.399431692 -0300
+@@ -60,7 +60,7 @@
+          struct ip *ip = (struct ip *) ptr;
+ 
+ #ifdef _LITTLE_ENDIAN
+-         bzero(tip, sizeof(*tip));
++         memset(tip, 0, sizeof(*tip));
+          tip->ip_len = ntohs(ip->ip_len);
+          tip->ip_id  = ntohs(ip->ip_id);
+          tip->ip_off = ntohs(ip->ip_off);
+@@ -246,7 +246,7 @@
+                            if (prvfragOffset != NULL) {
+                               prvfragOffset->nxt = fragOffset->nxt;
+                            } else {
+-                              bcopy((char *) fragOffset->nxt , (char *)&frag->offsets, sizeof(frag->offsets));
++                              memcpy((char *) fragOffset->nxt , (char *)&frag->offsets, sizeof(frag->offsets));
+                            }
+ /* else just update the prv fragments pointer to toss this one */
+                         } else {
+diff -Nura argus-3.0.6.1.orig/argus/ArgusIcmp.c argus-3.0.6.1/argus/ArgusIcmp.c
+--- argus-3.0.6.1.orig/argus/ArgusIcmp.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusIcmp.c	2014-06-17 11:23:00.353430136 -0300
+@@ -203,7 +203,7 @@
+ 
+                         case ICMP_REDIRECT_NET:
+                         case ICMP_REDIRECT_HOST:
+-                           bcopy ((char *) &icmp->icmp_ip.ip_dst.s_addr, (char *)&icmpFlow->id, sizeof (int));
++                           memcpy((char *) &icmp->icmp_ip.ip_dst.s_addr, (char *)&icmpFlow->id, sizeof (int));
+                            break;
+                      }
+                      break;
+@@ -250,7 +250,7 @@
+          net->hdr.subtype          = ARGUS_ICMP_DSR;
+          net->hdr.argus_dsrvl8.qual = 0;
+          net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusICMPObject)+3))/4 + 1;
+-         bzero ((char *)icmpObj, sizeof(*icmpObj));
++         memset((char *)icmpObj, 0, sizeof(*icmpObj));
+ 
+          icmpObj->icmp_type = icmp->icmp_type;
+          icmpObj->icmp_code = icmp->icmp_code;
+@@ -342,7 +342,7 @@
+                   }
+ 
+                   dsr->argus_dsrvl8.len  = (sizeof (struct ArgusIcmpStruct) + 3)/4 + 1;
+-                  bcopy ((char *) icmpObj, (char *) (dsr + 1), sizeof (*icmpObj));
++                  memcpy((char *) icmpObj, (char *) (dsr + 1), sizeof (*icmpObj));
+                   flow->dsrs[ARGUS_ICMP_INDEX] = dsr;
+                   flow->dsrindex |= 1 << ARGUS_ICMP_INDEX;
+ 
+@@ -389,7 +389,7 @@
+          net->hdr.subtype          = ARGUS_ICMP_DSR;
+          net->hdr.argus_dsrvl8.qual = 0;
+          net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusICMPObject)+3))/4 + 1;
+-         bzero ((char *)icmpObj, sizeof(*icmpObj));
++         memset((char *)icmpObj, 0, sizeof(*icmpObj));
+ 
+          icmpObj->icmp_type = icmpv6->icmp6_type;
+          icmpObj->icmp_code = icmpv6->icmp6_code;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusIsis.c argus-3.0.6.1/argus/ArgusIsis.c
+--- argus-3.0.6.1.orig/argus/ArgusIsis.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusIsis.c	2014-06-17 11:23:00.323429121 -0300
+@@ -78,11 +78,11 @@
+       }
+ 
+       if (dstgteq) {
+-         bcopy ((char *) ep, (char *)&model->ArgusThisFlow->mac_flow.ehdr, sizeof (struct ether_header));
++         memcpy((char *) ep, (char *)&model->ArgusThisFlow->mac_flow.ehdr, sizeof (struct ether_header));
+       } else {
+          model->state |= ARGUS_DIRECTION;
+-         bcopy ((char *)&ep->ether_shost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, ETH_ALEN);
+-         bcopy ((char *)&ep->ether_dhost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, ETH_ALEN);
++         memcpy((char *)&ep->ether_shost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, ETH_ALEN);
++         memcpy((char *)&ep->ether_dhost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, ETH_ALEN);
+       }
+       model->ArgusThisFlow->mac_flow.ehdr.ether_type = ep->ether_type;
+ 
+@@ -156,8 +156,8 @@
+          model->ArgusThisFlow->hdr.argus_dsrvl8.qual = ARGUS_TYPE_ISIS;
+          model->ArgusThisFlow->hdr.argus_dsrvl8.len  = ((sizeof(*isis) + 3)/4) + 1;
+ 
+-         bcopy ((char *)&ep->ether_shost, (char *)&isis->esrc, 6);
+-         bcopy ((char *)&ep->ether_dhost, (char *)&isis->edst, 6);
++         memcpy((char *)&ep->ether_shost, (char *)&isis->esrc, 6);
++         memcpy((char *)&ep->ether_dhost, (char *)&isis->edst, 6);
+ 
+ 	 isis->proto_version = header->version;
+ 
+@@ -167,10 +167,10 @@
+                const struct isis_iih_lan_header *header_iih_lan = (const struct isis_iih_lan_header *)pptr;
+                if (header->fixed_len == (ISIS_COMMON_HEADER_SIZE+ISIS_IIH_LAN_HEADER_SIZE)) {
+                   isis->pdu_type = pdu_type;
+-                  bzero ((char *)&isis->isis_un.hello.srcid, sizeof(isis->isis_un.hello.srcid));
+-                  bzero ((char *)&isis->isis_un.hello.lanid, sizeof(isis->isis_un.hello.lanid));
+-                  bcopy ((char *)&header_iih_lan->source_id, (char *)&isis->isis_un.hello.srcid, SYSTEM_ID_LEN);
+-                  bcopy ((char *)&header_iih_lan->lan_id, (char *)&isis->isis_un.hello.lanid, NODE_ID_LEN);
++                  memset((char *)&isis->isis_un.hello.srcid, 0, sizeof(isis->isis_un.hello.srcid));
++                  memset((char *)&isis->isis_un.hello.lanid, 0, sizeof(isis->isis_un.hello.lanid));
++                  memcpy((char *)&header_iih_lan->source_id, (char *)&isis->isis_un.hello.srcid, SYSTEM_ID_LEN);
++                  memcpy((char *)&header_iih_lan->lan_id, (char *)&isis->isis_un.hello.lanid, NODE_ID_LEN);
+ 
+                   retn = model->ArgusThisFlow;
+                   {
+@@ -191,7 +191,7 @@
+                const struct isis_lsp_header *header_lsp = (const struct isis_lsp_header *)pptr;
+                if (header->fixed_len == (ISIS_COMMON_HEADER_SIZE+ISIS_LSP_HEADER_SIZE)) {
+                   isis->pdu_type = pdu_type;
+-                  bcopy ((char *)&header_lsp->lsp_id, (char *)&isis->isis_un.lsp.lspid, LSP_ID_LEN);
++                  memcpy((char *)&header_lsp->lsp_id, (char *)&isis->isis_un.lsp.lspid, LSP_ID_LEN);
+                   isis->isis_un.lsp.seqnum = EXTRACT_32BITS(header_lsp->sequence_number);
+ 		  isis->chksum = EXTRACT_16BITS(header_lsp->checksum);
+                   retn = model->ArgusThisFlow;
+@@ -215,7 +215,7 @@
+                const struct isis_csnp_header *header_csnp = (const struct isis_csnp_header *)pptr;
+                if (header->fixed_len == (ISIS_COMMON_HEADER_SIZE+ISIS_CSNP_HEADER_SIZE)) {
+                   isis->pdu_type = pdu_type;
+-                  bcopy ((char *)&header_csnp->source_id, (char *)&isis->isis_un.csnp.srcid, NODE_ID_LEN);
++                  memcpy((char *)&header_csnp->source_id, (char *)&isis->isis_un.csnp.srcid, NODE_ID_LEN);
+                   {
+                      u_int16_t *ptr = (u_int16_t *) (((long)pptr & 0x01) ? (pptr - 1) : pptr);
+                      int tlen = (length - ISIS_COMMON_HEADER_SIZE);
+@@ -235,7 +235,7 @@
+                const struct isis_psnp_header *header_psnp = (const struct isis_psnp_header *)pptr;
+                if (header->fixed_len == (ISIS_COMMON_HEADER_SIZE+ISIS_PSNP_HEADER_SIZE)) {
+                   isis->pdu_type = pdu_type;
+-                  bcopy ((char *)&header_psnp->source_id, (char *)&isis->isis_un.psnp.srcid, NODE_ID_LEN);
++                  memcpy((char *)&header_psnp->source_id, (char *)&isis->isis_un.psnp.srcid, NODE_ID_LEN);
+                   retn = model->ArgusThisFlow;
+                   {
+                      u_int16_t *ptr = (u_int16_t *) (((long)pptr & 0x01) ? (pptr - 1) : pptr);
+@@ -287,7 +287,7 @@
+             net->hdr.argus_dsrvl8.qual = 0;
+             net->hdr.argus_dsrvl8.len  = (sizeof (struct ArgusIsisObject) + 3)/4;
+             flowstr->dsrs[ARGUS_NETWORK_INDEX] = &flowstr->canon.net.hdr;
+-            bcopy ((char *)header, (char *)&flowstr->canon.net.net_union.isis.common, sizeof(*header));
++            memcpy((char *)header, (char *)&flowstr->canon.net.net_union.isis.common, sizeof(*header));
+ 
+             switch (header->pdu_type) {
+                case L1_LAN_IIH:
+@@ -350,7 +350,7 @@
+    unsigned char rev = flow->state.rev, dir = flow->state.dir;
+    flow->ArgusTransactionNum = ArgusTransactionNum++;
+                                                                                                                            
+-   bzero ((char *)&flow->state, sizeof(flow->state));
++   memset((char *)&flow->state, 0, sizeof(flow->state));
+    flow->state.rev = rev;
+    flow->state.dir = dir;
+                                                                                                                            
+diff -Nura argus-3.0.6.1.orig/argus/ArgusLcp.c argus-3.0.6.1/argus/ArgusLcp.c
+--- argus-3.0.6.1.orig/argus/ArgusLcp.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusLcp.c	2014-06-17 11:23:00.337429594 -0300
+@@ -95,7 +95,7 @@
+ */
+          flowstr->dsrs[ARGUS_NETWORK_INDEX] = (void *) net;
+ 
+-         bzero ((char *)lcpObj, sizeof(*lcpObj));
++         memset((char *)lcpObj, 0, sizeof(*lcpObj));
+          flowstr->timeout = ARGUS_IPTIMEOUT;
+ 
+       } else {
+diff -Nura argus-3.0.6.1.orig/argus/ArgusMac.c argus-3.0.6.1/argus/ArgusMac.c
+--- argus-3.0.6.1.orig/argus/ArgusMac.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusMac.c	2014-06-17 11:23:00.388431320 -0300
+@@ -48,7 +48,7 @@
+    struct ArgusMacStruct *mac = (struct ArgusMacStruct *) flowstr->MacDSRBuffer;
+       
+    if (mac && ((length = argus->ahdr.length) > 0)) {
+-      bcopy ((char *)mac, &((char *)argus)[argus->ahdr.length], sizeof(*mac));
++      memcpy((char *)mac, &((char *)argus)[argus->ahdr.length], sizeof(*mac));
+       argus->ahdr.length += sizeof(*mac);
+    }
+ }
+diff -Nura argus-3.0.6.1.orig/argus/ArgusModeler.c argus-3.0.6.1/argus/ArgusModeler.c
+--- argus-3.0.6.1.orig/argus/ArgusModeler.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusModeler.c	2014-06-17 11:23:00.372430778 -0300
+@@ -74,7 +74,7 @@
+    if ((retn = (struct ArgusModelerStruct *) ArgusCalloc (1, sizeof (struct ArgusModelerStruct))) == NULL)
+       ArgusLog (LOG_ERR, "ArgusCloneModeler () ArgusCalloc error %s\n", strerror(errno));
+ 
+-   bcopy((char *)src, (char *)retn, sizeof(*src));
++   memcpy((char *)src, (char *)retn, sizeof(*src));
+ 
+    retn->ArgusSrc           = NULL;
+    retn->ArgusHashTable     = NULL;
+@@ -84,7 +84,7 @@
+    retn->ArgusThisFlow      = NULL;
+    retn->ArgusOutputList    = NULL;
+ 
+-   bzero (retn->ArgusTimeOutQueue, sizeof(retn->ArgusTimeOutQueue));
++   memset(retn->ArgusTimeOutQueue, 0, sizeof(retn->ArgusTimeOutQueue));
+ 
+ #if defined(ARGUS_THREADS)
+    pthread_mutex_init(&retn->lock, NULL);
+@@ -122,7 +122,7 @@
+    int debug = 0;
+ #endif
+ 
+-   bzero (model->ArgusTimeOutQueue, sizeof(model->ArgusTimeOutQueue));
++   memset(model->ArgusTimeOutQueue, 0, sizeof(model->ArgusTimeOutQueue));
+    model->ArgusInProtocol = 1;
+    model->ArgusUpdateInterval.tv_usec = 200000;
+    model->ArgusMajorVersion = VERSION_MAJOR;
+@@ -1003,7 +1003,7 @@
+          model->ArgusThisEncaps |= ARGUS_ENCAPS_LLC;
+ 
+          llc = model->ArgusThisLLC;
+-         bcopy((char *) ptr, (char *) llc, sizeof (struct llc));
++         memcpy((char *) ptr, (char *) llc, sizeof (struct llc));
+ 
+ #define ARGUS_IPX_TAG         100
+ 
+@@ -1119,7 +1119,7 @@
+       model->ArgusThisEncaps |= ARGUS_ENCAPS_LLC;
+ 
+       llc = model->ArgusThisLLC;
+-      bcopy((char *) ptr, (char *) llc, sizeof (struct llc));
++      memcpy((char *) ptr, (char *) llc, sizeof (struct llc));
+ 
+ #define ARGUS_IPX_TAG         100
+ 
+@@ -1916,11 +1916,11 @@
+                   }
+ 
+                   if (dstgteq) {
+-                     bcopy ((char *) ep, (char *)&model->ArgusThisFlow->mac_flow.ehdr, sizeof (struct ether_header));
++                     memcpy((char *) ep, (char *)&model->ArgusThisFlow->mac_flow.ehdr, sizeof (struct ether_header));
+                   } else {
+                      model->state |= ARGUS_DIRECTION;
+-                     bcopy ((char *)&ep->ether_shost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, ETH_ALEN);
+-                     bcopy ((char *)&ep->ether_dhost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, ETH_ALEN);
++                     memcpy((char *)&ep->ether_shost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, ETH_ALEN);
++                     memcpy((char *)&ep->ether_dhost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, ETH_ALEN);
+                   }
+                   model->ArgusThisFlow->mac_flow.ehdr.ether_type = ntohs(ep->ether_type);
+ 
+@@ -2025,7 +2025,7 @@
+          retn->dsrs[ARGUS_FLOW_INDEX] = (struct ArgusDSRHeader *) &retn->canon.flow.hdr;
+          retn->canon.flow.hdr = flow->hdr;
+ 
+-         bcopy ((char *)&flow->flow_un, (char *)&retn->canon.flow.flow_un, (flow->hdr.argus_dsrvl8.len - 1) * 4);
++         memcpy((char *)&flow->flow_un, (char *)&retn->canon.flow.flow_un, (flow->hdr.argus_dsrvl8.len - 1) * 4);
+          retn->dsrindex |= 1 << ARGUS_FLOW_INDEX;
+ 
+          if (retn->state & ARGUS_DIRECTION)
+@@ -2207,7 +2207,7 @@
+             mac->hdr.argus_dsrvl8.len    = 5;
+ 
+             if (model->ArgusThisDir) {
+-               bcopy ((char *)model->ArgusThisEpHdr, (char *)&mac->mac.mac_union.ether, sizeof(struct ether_header));
++               memcpy((char *)model->ArgusThisEpHdr, (char *)&mac->mac.mac_union.ether, sizeof(struct ether_header));
+             } else {
+                bcopy ((char *)&model->ArgusThisEpHdr->ether_dhost, 
+                       (char *)&mac->mac.mac_union.ether.ehdr.ether_shost, sizeof(struct ether_addr));
+@@ -2314,8 +2314,8 @@
+ 
+          flow->dsrindex |= 1 << ARGUS_JITTER_INDEX;
+ 
+-         bzero((char *)&jitter->act,  sizeof(struct ArgusJitterObject));
+-         bzero((char *)&jitter->idle, sizeof(struct ArgusJitterObject));
++         memset((char *)&jitter->act, 0, sizeof(struct ArgusJitterObject));
++         memset((char *)&jitter->idle, 0, sizeof(struct ArgusJitterObject));
+ 
+          memset(&flow->stime.act,  0, sizeof(flow->stime.act));
+          memset(&flow->stime.idle, 0, sizeof(flow->stime.idle));
+@@ -2818,7 +2818,7 @@
+             int i, x, len = 0, dsrlen = 1;
+             struct ArgusDSRHeader *dsr;
+ 
+-            bcopy ((char *)&rec->hdr, (char *)&retn->hdr, sizeof(retn->hdr));
++            memcpy((char *)&rec->hdr, (char *)&retn->hdr, sizeof(retn->hdr));
+             dsrptr = (unsigned int *)&retn->ar_un.mar;
+ 
+             dsrindex = rec->dsrindex;
+@@ -2851,8 +2851,8 @@
+                                     dsrptr[2] = ((unsigned int *)dsr)[2];
+                                     dsrptr[3] = ((unsigned int *)dsr)[3];
+ 
+-                                    bcopy (&rarp->shaddr, &((char *)&dsrptr[4])[0],         rarp->hln);
+-                                    bcopy (&rarp->dhaddr, &((char *)&dsrptr[4])[rarp->hln], rarp->hln);
++                                    memcpy(&rarp->shaddr, &((char *)&dsrptr[4])[0], rarp->hln);
++                                    memcpy(&rarp->dhaddr, &((char *)&dsrptr[4])[rarp->hln], rarp->hln);
+                                     dsrptr += dsr->argus_dsrvl8.len;
+                                     break;
+                                  }
+@@ -2867,7 +2867,7 @@
+                                     dsrptr[2] = ((unsigned int *)dsr)[2];
+                                     dsrptr[3] = ((unsigned int *)dsr)[3];
+                                     dsrptr[4] = ((unsigned int *)dsr)[4];
+-                                    bcopy (&arp->haddr,  &((char *)&dsrptr[5])[0], arp->hln);
++                                    memcpy(&arp->haddr, &((char *)&dsrptr[5])[0], arp->hln);
+                                     dsrptr += dsr->argus_dsrvl8.len;
+                                     break;
+                                  }
+@@ -2906,7 +2906,7 @@
+                               tcp->status = tobj->status;
+                               tcp->src    = tobj->src.flags;
+                               tcp->dst    = tobj->dst.flags;
+-                              bzero(&tcp->pad, sizeof(tcp->pad));
++                              memset(&tcp->pad, 0, sizeof(tcp->pad));
+                               dsrptr     += len;
+                               break;
+                            }
+@@ -3395,7 +3395,7 @@
+             break;
+          }
+          case ARGUS_MAR: {
+-            bcopy ((char *)&rec->canon, (char *) retn, rec->hdr.len * 4);
++            memcpy((char *)&rec->canon, (char *) retn, rec->hdr.len * 4);
+             retn->hdr = rec->hdr;
+             if (state)
+                retn->hdr.cause = (state & 0xF0) | (retn->hdr.cause & 0x0F);
+@@ -3431,14 +3431,14 @@
+       switch (rec->hdr.type & 0xF0) {
+          case ARGUS_EVENT: {
+             if ((retn = (struct ArgusRecordStruct *) ArgusMallocListRecord (ARGUS_MAX_OS_STATUS)) != NULL)
+-               bcopy ((char *)rec, (char *)retn, ARGUS_MAX_OS_STATUS);
++               memcpy((char *)rec, (char *)retn, ARGUS_MAX_OS_STATUS);
+             break;
+          }
+ 
+          case ARGUS_FAR: {
+             if ((retn = (struct ArgusRecordStruct *) ArgusMallocListRecord (sizeof(*retn))) != NULL) {
+-               bcopy ((char *)&rec->hdr, (char *)&retn->hdr, sizeof (rec->hdr));
+-               bcopy ((char *)&rec->canon, (char *)&retn->canon, sizeof (rec->canon));
++               memcpy((char *)&rec->hdr, (char *)&retn->hdr, sizeof (rec->hdr));
++               memcpy((char *)&rec->canon, (char *)&retn->canon, sizeof (rec->canon));
+ 
+                retn->status    = rec->status;
+                retn->trans     = rec->trans;
+@@ -3467,7 +3467,7 @@
+                               struct ArgusDataStruct *user = (struct ArgusDataStruct *) rec->dsrs[i];
+                               if (user->count > 0) {
+                                  if ((retn->dsrs[i] = (void *) ArgusCalloc(1, (8 + user->size))) != NULL) {
+-                                    bcopy ((char *)rec->dsrs[i], (char *)retn->dsrs[i], 8 + user->count);
++                                    memcpy((char *)rec->dsrs[i], (char *)retn->dsrs[i], 8 + user->count);
+                                  } else {
+                                     retn->dsrindex &= ~(0x01 << i);
+                                  }
+@@ -3518,7 +3518,7 @@
+ 
+    if ((retn = (struct ArgusRecordStruct *) ArgusMallocListRecord (sizeof(*retn))) != NULL) {
+       if (flow) {
+-         bcopy ((char *)&flow->canon, (char *)&retn->canon, sizeof (flow->canon));
++         memcpy((char *)&flow->canon, (char *)&retn->canon, sizeof (flow->canon));
+          if ((retn->dsrindex = flow->dsrindex) != 0) {
+             for (i = 0; i < ARGUSMAXDSRTYPE; i++) {
+                if (flow->dsrs[i] != NULL) {
+@@ -3717,8 +3717,8 @@
+ 
+       } else {
+          retn->dsrindex = 0;
+-         bzero ((char *)&retn->canon, sizeof(retn->canon));
+-         bzero ((char *)&retn->dsrs, sizeof(retn->dsrs));
++         memset((char *)&retn->canon, 0, sizeof(retn->canon));
++         memset((char *)&retn->dsrs, 0, sizeof(retn->dsrs));
+       }
+ 
+       if (!(flow) && ((state == ARGUS_STOP) || (state == ARGUS_ERROR))) {
+@@ -4073,7 +4073,7 @@
+       model->ArgusThisIpHdr = ip;
+  
+ #ifdef _LITTLE_ENDIAN
+-      bzero(tip, sizeof(*tip));
++      memset(tip, 0, sizeof(*tip));
+       tip->ip_len = ntohs(ip->ip_len);
+       tip->ip_id  = ntohs(ip->ip_id);
+       tip->ip_v   = ip->ip_v;
+@@ -4098,7 +4098,7 @@
+       model->ArgusSnapLength -= hlen;
+ 
+       if (model->ArgusFlowKey & ARGUS_FLOW_KEY_CLASSIC5TUPLE) {
+-         bzero ((char *)model->ArgusThisFlow, sizeof(*model->ArgusThisFlow));
++         memset((char *)model->ArgusThisFlow, 0, sizeof(*model->ArgusThisFlow));
+          model->ArgusThisFlow->hdr.type             = ARGUS_FLOW_DSR;
+          model->ArgusThisFlow->hdr.subtype          = ARGUS_FLOW_CLASSIC5TUPLE;
+          model->ArgusThisFlow->hdr.argus_dsrvl8.qual = ARGUS_TYPE_IPV4;
+@@ -4156,7 +4156,7 @@
+                      }
+                      if ((sport == 53) || (dport == 53)) {
+                         unsigned short pad = ntohs(*(u_int16_t *)(up + 1));
+-                        bcopy(&pad, &model->ArgusThisFlow->ip_flow.smask, 2);
++                        memcpy(&pad, &model->ArgusThisFlow->ip_flow.smask, 2);
+                      }
+                   }
+                   break;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusNetflow.c argus-3.0.6.1/argus/ArgusNetflow.c
+--- argus-3.0.6.1.orig/argus/ArgusNetflow.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusNetflow.c	2014-06-17 11:23:00.395431556 -0300
+@@ -164,8 +164,8 @@
+             switch (ArgusReadCiscoVersion) {
+                case CISCO_VERSION_1: {
+                   CiscoFlowEntryV1_t *ArgusNetFlow = (CiscoFlowEntryV1_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -257,11 +257,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -336,8 +336,8 @@
+ 
+                case CISCO_VERSION_5: {
+                   CiscoFlowEntryV5_t *ArgusNetFlow = (CiscoFlowEntryV5_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -444,11 +444,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -523,8 +523,8 @@
+ 
+                case CISCO_VERSION_6: {
+                   CiscoFlowEntryV6_t *ArgusNetFlow = (CiscoFlowEntryV6_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -631,11 +631,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -710,8 +710,8 @@
+ 
+                case CISCO_VERSION_7: {
+                   CiscoFlowEntryV7_t *ArgusNetFlow = (CiscoFlowEntryV7_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -818,11 +818,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -1024,7 +1024,7 @@
+             tData++;
+          }
+ 
+-         bcopy(tHdr, dArray, slen);
++         memcpy(tHdr, dArray, slen);
+          templates[tHdr->template_id] = dArray;
+ 
+          if ((len - slen) > 0) {
+diff -Nura argus-3.0.6.1.orig/argus/ArgusOutput.c argus-3.0.6.1/argus/ArgusOutput.c
+--- argus-3.0.6.1.orig/argus/ArgusOutput.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusOutput.c	2014-06-17 11:23:00.346429899 -0300
+@@ -325,7 +325,7 @@
+ #ifdef ARGUSDEBUG
+                {
+                   char buf[MAXSTRLEN];
+-                  bzero(buf, MAXSTRLEN);
++                  memset(buf, 0, MAXSTRLEN);
+                   nff_dump(&client->ArgusNFFcode, buf, MAXSTRLEN, 1);
+                   ArgusDebug (5, "ArgusInitOutput: ArgusFilterCompile returned: \n%s\n", buf);
+                }
+@@ -715,7 +715,7 @@
+ #endif
+                            ArgusWriteRecord = 1;
+                            if (client->ArgusFilterInitialized) {
+-                              bcopy(&rec->hdr, &rec->canon.hdr, sizeof(rec->hdr));
++                              memcpy(&rec->hdr, &rec->canon.hdr, sizeof(rec->hdr));
+                               if (!(ArgusFilterRecord ((struct nff_insn *)client->ArgusNFFcode.bf_insns, rec)))
+                                  ArgusWriteRecord = 0;
+                            }
+@@ -979,7 +979,7 @@
+ #endif
+             if ((host = gethostbyname (baddr)) != NULL) {
+                if ((host->h_addrtype == AF_INET) && (host->h_length == 4)) {
+-                  bcopy ((char *) *host->h_addr_list, (char *)&sin.sin_addr.s_addr, host->h_length);
++                  memcpy((char *) *host->h_addr_list, (char *)&sin.sin_addr.s_addr, host->h_length);
+                } else
+                   ArgusLog (LOG_ERR, "ArgusEstablishListen() unsupported bind address %s", baddr);
+             } else
+@@ -1099,7 +1099,7 @@
+                int niflags;
+                salen = sizeof(remoteaddr);
+ 
+-               bzero(hbuf, sizeof(hbuf));
++               memset(hbuf, 0, sizeof(hbuf));
+ 
+                if (getpeername(fd, (struct sockaddr *)&remoteaddr, &salen) == 0 &&
+                    (remoteaddr.ss_family == AF_INET || remoteaddr.ss_family == AF_INET6)) {
+@@ -1267,7 +1267,7 @@
+    unsigned int outputlen = 0;
+ #endif /* ARGUS_SASL */
+ 
+-   bzero(buf, MAXSTRLEN);
++   memset(buf, 0, MAXSTRLEN);
+ 
+    if (value == 0)
+       value = MAXSTRLEN;
+@@ -1312,8 +1312,8 @@
+          }
+          if (outputlen > 0) {
+             if (outputlen < MAXSTRLEN) {
+-               bzero (buf, MAXSTRLEN);
+-               bcopy (outputbuf, buf, outputlen);
++               memset(buf, 0, MAXSTRLEN);
++               memcpy(outputbuf, buf, outputlen);
+                cnt = outputlen;
+             } else
+                ArgusLog (LOG_ERR, "ArgusCheckClientMessage(%p, %d) sasl_decode returned %d bytes\n", client, fd, outputlen);
+@@ -1344,7 +1344,7 @@
+                } else {
+ #ifdef ARGUSDEBUG
+                   char buf[MAXSTRLEN];
+-                  bzero(buf, MAXSTRLEN);
++                  memset(buf, 0, MAXSTRLEN);
+                   nff_dump(&client->ArgusNFFcode, buf, MAXSTRLEN, 1);
+                   ArgusDebug (5, "ArgusInitOutput: ArgusFilterCompile returned: \n%s\n", buf);
+ #endif
+@@ -1738,7 +1738,7 @@
+ {
+     static sasl_security_properties_t ret;
+ 
+-    bzero((char *)&ret, sizeof(ret));
++    memset((char *)&ret, 0, sizeof(ret));
+ 
+     ret.maxbufsize = PROT_BUFSIZE;
+     ret.min_ssf = ArgusMinSsf; /* minimum allowable security strength */
+diff -Nura argus-3.0.6.1.orig/argus/ArgusSflow.c argus-3.0.6.1/argus/ArgusSflow.c
+--- argus-3.0.6.1.orig/argus/ArgusSflow.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusSflow.c	2014-06-17 11:23:00.350430034 -0300
+@@ -160,8 +160,8 @@
+             switch (ArgusReadCiscoVersion) {
+                case CISCO_VERSION_1: {
+                   CiscoFlowEntryV1_t *ArgusNetFlow = (CiscoFlowEntryV1_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -253,11 +253,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -332,8 +332,8 @@
+ 
+                case CISCO_VERSION_5: {
+                   CiscoFlowEntryV5_t *ArgusNetFlow = (CiscoFlowEntryV5_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -440,11 +440,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -519,8 +519,8 @@
+ 
+                case CISCO_VERSION_6: {
+                   CiscoFlowEntryV6_t *ArgusNetFlow = (CiscoFlowEntryV6_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -627,11 +627,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+@@ -706,8 +706,8 @@
+ 
+                case CISCO_VERSION_7: {
+                   CiscoFlowEntryV7_t *ArgusNetFlow = (CiscoFlowEntryV7_t *) ptr;
+-                  bzero(sflow, sizeof(*sflow));
+-                  bzero(hstruct, sizeof(*hstruct));
++                  memset(sflow, 0, sizeof(*sflow));
++                  memset(hstruct, 0, sizeof(*hstruct));
+ 
+                   sflow->hdr.type              = ARGUS_FLOW_DSR;
+                   sflow->hdr.subtype           = ARGUS_FLOW_CLASSIC5TUPLE;
+@@ -814,11 +814,11 @@
+                         ArgusNetFlow->input = ntohs(ArgusNetFlow->input);
+                         ArgusNetFlow->output = ntohs(ArgusNetFlow->output);
+ #if defined(HAVE_SOLARIS)
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost.ether_addr_octet[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost.ether_addr_octet[4], 2);
+ #else
+-                        bcopy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
+-                        bcopy((char *)&ArgusNetFlow->output,(char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->input, (char *)&mac->mac.mac_union.ether.ehdr.ether_shost[4], 2);
++                        memcpy((char *)&ArgusNetFlow->output, (char *)&mac->mac.mac_union.ether.ehdr.ether_dhost[4], 2);
+ #endif
+                         flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
+                         flow->dsrs[ARGUS_MAC_INDEX] = (void *)mac;
+diff -Nura argus-3.0.6.1.orig/argus/ArgusSource.c argus-3.0.6.1/argus/ArgusSource.c
+--- argus-3.0.6.1.orig/argus/ArgusSource.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusSource.c	2014-06-17 11:23:00.428432673 -0300
+@@ -86,7 +86,7 @@
+    retn->type   = dev->type;
+    retn->link   = dev->link;
+ 
+-   bcopy((char *)&dev->ArgusID, (char *)&retn->ArgusID, sizeof(dev->ArgusID));
++   memcpy((char *)&dev->ArgusID, (char *)&retn->ArgusID, sizeof(dev->ArgusID));
+    retn->idtype = dev->idtype;
+    retn->name   = strdup(dev->name);
+ 
+@@ -151,7 +151,7 @@
+    retn->ArgusInterfaces = src->ArgusInterfaces;
+ 
+    for (i = 0; i < src->ArgusInterfaceIndex; i++)
+-      bcopy(&src->ArgusInterface[i], &retn->ArgusInterface[i], sizeof(src->ArgusInterface[i]));
++      memcpy(&src->ArgusInterface[i], &retn->ArgusInterface[i], sizeof(src->ArgusInterface[i]));
+ 
+    retn->ArgusInputPacketFileType = src->ArgusInputPacketFileType;
+    retn->ArgusReadingOffLine = src->ArgusReadingOffLine;
+@@ -354,7 +354,7 @@
+    int retn = 0, i = 0;
+ 
+    src->ArgusInterfaces = 0;
+-   bzero ((char *)&src->ArgusInterface, sizeof(src->ArgusInterface));
++   memset((char *)&src->ArgusInterface, 0, sizeof(src->ArgusInterface));
+ 
+    if (src->ArgusDeviceList == NULL) {
+       pcap_if_t *d;
+@@ -428,7 +428,7 @@
+       if (src->ArgusInputFilter != NULL) {
+          for (i = 0; i < src->ArgusInterfaces; i++) {
+             if (src->ArgusInterface[i].ArgusPd) {
+-               bzero ((char *) &src->ArgusInterface[i].ArgusFilter, sizeof (struct bpf_program));
++               memset((char *) &src->ArgusInterface[i].ArgusFilter, 0, sizeof (struct bpf_program));
+ 
+                if (pcap_compile (src->ArgusInterface[i].ArgusPd, &src->ArgusInterface[i].ArgusFilter, src->ArgusInputFilter, getArgusOflag(src), src->ArgusInterface[i].ArgusNetMask) < 0)
+                   ArgusLog (LOG_ERR, "%s\n", pcap_geterr (src->ArgusInterface[i].ArgusPd));
+@@ -560,7 +560,7 @@
+ {
+    src->ArgusID.a_un.value = 0;
+    switch (type) {
+-      case ARGUS_TYPE_STRING: bcopy((char *)ptr, &src->ArgusID.a_un.str, strlen((char *)ptr)); break;
++      case ARGUS_TYPE_STRING: memcpy((char *)ptr, &src->ArgusID.a_un.str, strlen((char *)ptr)); break;
+       case ARGUS_TYPE_INT:    src->ArgusID.a_un.value = atoi((char *)ptr); break;
+       case ARGUS_TYPE_IPV4:   src->ArgusID.a_un.ipv4 = ntohl(*(unsigned int *)ptr); break;
+    }
+@@ -1063,7 +1063,7 @@
+    int retn = 0, length = 0;
+    struct ip *iphdr = NULL;
+ 
+-   bzero (ArgusMoatPktHdr, sizeof(MoatTshBuffer));
++   memset(ArgusMoatPktHdr, 0, sizeof(MoatTshBuffer));
+  
+    if ((retn = read(pcap_fileno(src->ArgusInterface[0].ArgusPd), ArgusMoatPktHdr, ARGUSMOATLEN)) == ARGUSMOATLEN) {
+       ArgusMoatPktHdr->interface = 0;
+@@ -1278,7 +1278,7 @@
+          struct addrinfo *host, hints;
+          int retn, done = 0;
+ 
+-         bzero(&hints, sizeof(hints));
++         memset(&hints, 0, sizeof(hints));
+          hints.ai_family   = AF_INET;
+ 
+ #if defined(HAVE_INET_ATON)
+@@ -1297,7 +1297,7 @@
+                   case AF_INET:  {
+                      struct sockaddr_in *sa = (struct sockaddr_in *) host->ai_addr;
+                      unsigned int value;
+-                     bcopy ((char *)&sa->sin_addr, (char *)&value, 4);
++                     memcpy((char *)&sa->sin_addr, (char *)&value, 4);
+ 
+                      setArgusID (src, &value, ARGUS_TYPE_IPV4);
+                      done++;
+@@ -1334,7 +1334,7 @@
+          if ((host = gethostbyname(optarg)) != NULL) {
+             if ((host->h_addrtype == 2) && (host->h_length == 4)) {
+                unsigned int value;
+-               bcopy ((char *) *host->h_addr_list, (char *)&value, host->h_length);
++               memcpy((char *) *host->h_addr_list, (char *)&value, host->h_length);
+                setArgusID (&src->ArgusID, ntohl(value));
+                src->type = ARGUS_TYPE_IPV4;
+ 
+@@ -1746,7 +1746,7 @@
+    caplen -= archdrlen;
+    p += archdrlen;
+    
+-   bcopy (p, (char *)ep, caplen);
++   memcpy(p, (char *)ep, caplen);
+ 
+    src->ArgusModel->ArgusThisLength  = length;
+    src->ArgusModel->ArgusSnapLength  = caplen;
+@@ -2715,7 +2715,7 @@
+    if ((rthdr_len = rthdr->it_len) < 8)
+       return;
+ 
+-   bzero(&src->ArgusThisRadioTap, sizeof(src->ArgusThisRadioTap));
++   memset(&src->ArgusThisRadioTap, 0, sizeof(src->ArgusThisRadioTap));
+ 
+    if (h->caplen < rthdr_len)
+       return;
+@@ -2946,8 +2946,8 @@
+          fsrc[i] = fddi_bit_swap[fp->fddi_shost[i]];
+    }
+    else {
+-      bcopy ((char *) fp->fddi_dhost, fdst, 6);
+-      bcopy ((char *) fp->fddi_shost, fsrc, 6);
++      memcpy((char *) fp->fddi_dhost, fdst, 6);
++      memcpy((char *) fp->fddi_shost, fsrc, 6);
+    }
+ }
+ 
+@@ -2967,7 +2967,7 @@
+          ((struct ether_header *) ep)->ether_type = EXTRACT_16BITS(&llc->ethertype[0]);
+          ptr = (unsigned char *)(llc + 1);
+          length -= (sizeof(struct fddi_header) + sizeof(struct llc));
+-         bcopy ((char *)ptr, (char *)(ep + 1), length);
++         memcpy((char *)ptr, (char *)(ep + 1), length);
+          retn = length + sizeof(struct ether_header);
+       }
+    }
+@@ -3095,7 +3095,7 @@
+    caplen -= ARGUS_ATM_HDR_OFFSET;
+    p += ARGUS_ATM_HDR_OFFSET;
+    
+-   bcopy (p, (char *)(ep + 1), caplen);
++   memcpy(p, (char *)(ep + 1), caplen);
+ 
+    length += sizeof(*ep);
+    caplen += sizeof(*ep);
+@@ -4185,7 +4185,7 @@
+    if (strstr(device->name, "dag") || strstr(device->name, "nap")) {
+       for (i = 0; i < src->ArgusInterfaces; i++) {
+          if (src->ArgusInterface[i].ArgusPd && (pcap_fileno(src->ArgusInterface[i].ArgusPd) > 0))
+-            bzero ((char *)&src->ArgusInterface[i].ifr, sizeof(ifr));
++            memset((char *)&src->ArgusInterface[i].ifr, 0, sizeof(ifr));
+ 
+          src->ArgusInterface[i].ifr.ifr_flags |= IFF_UP;
+          setArgusInterfaceStatus(src, 1);
+@@ -4196,7 +4196,7 @@
+    if (strstr(device->name, "default")) {
+       for (i = 0; i < src->ArgusInterfaces; i++) {
+          if (src->ArgusInterface[i].ArgusPd && (pcap_fileno(src->ArgusInterface[i].ArgusPd) > 0))
+-            bzero ((char *)&src->ArgusInterface[i].ifr, sizeof(ifr));
++            memset((char *)&src->ArgusInterface[i].ifr, 0, sizeof(ifr));
+ 
+          src->ArgusInterface[i].ifr.ifr_flags |= IFF_UP;
+          setArgusInterfaceStatus(src, 1);
+diff -Nura argus-3.0.6.1.orig/argus/ArgusTcp.c argus-3.0.6.1/argus/ArgusTcp.c
+--- argus-3.0.6.1.orig/argus/ArgusTcp.c	2014-06-17 11:21:13.097802119 -0300
++++ argus-3.0.6.1/argus/ArgusTcp.c	2014-06-17 11:23:00.409432030 -0300
+@@ -82,7 +82,7 @@
+       unsigned char flags = thdr->th_flags;
+ 
+ #ifdef _LITTLE_ENDIAN
+-      bzero ((char *)tcp, sizeof(tcpbuf));
++      memset((char *)tcp, 0, sizeof(tcpbuf));
+       tcp->th_dport = ntohs(thdr->th_dport);
+       tcp->th_sport = ntohs(thdr->th_sport);
+       tcp->th_seq   = ntohl(thdr->th_seq);
+@@ -90,7 +90,7 @@
+       tcp->th_win   = ntohs(thdr->th_win);
+       tcp->th_flags = thdr->th_flags;
+ #else
+-      bcopy ((char *) thdr, (char *)tcp, sizeof(tcpbuf));
++      memcpy((char *) thdr, (char *)tcp, sizeof(tcpbuf));
+ #endif
+       if (*state == ARGUS_START) {
+          struct ArgusNetworkStruct *net = (struct ArgusNetworkStruct *) &flowstr->canon.net;
+@@ -100,7 +100,7 @@
+          net->hdr.argus_dsrvl8.qual = 0;
+          flowstr->dsrs[ARGUS_NETWORK_INDEX] = (struct ArgusDSRHeader *) net;
+          tcpExt                    = &net->net_union.tcp;
+-         bzero ((char *)tcpExt, sizeof(*tcpExt));
++         memset((char *)tcpExt, 0, sizeof(*tcpExt));
+ 
+          model->ArgusSnapLength -= tcphlen;
+          model->ArgusThisLength  = tcpdatalen;
+@@ -313,7 +313,7 @@
+ {
+    struct ArgusSystemFlow *fdsr = (struct ArgusSystemFlow *)flow->dsrs[ARGUS_FLOW_INDEX];
+    struct ArgusTCPObject *tcpExt = (struct ArgusTCPObject *)&flow->canon.net.net_union.tcp;
+-   bzero ((char *)tcpExt, sizeof(*tcpExt));
++   memset((char *)tcpExt, 0, sizeof(*tcpExt));
+ 
+    if (fdsr) {
+       if (model->ArgusThisDir)
+@@ -710,7 +710,7 @@
+ 
+       if (tcpdatalen > 0) {
+ #ifdef _LITTLE_ENDIAN
+-         bzero ((char *)tcp, sizeof(tcpbuf));
++         memset((char *)tcp, 0, sizeof(tcpbuf));
+          tcp->th_dport = ntohs(thdr->th_dport);
+          tcp->th_sport = ntohs(thdr->th_sport);
+          tcp->th_seq   = ntohl(thdr->th_seq);
+@@ -718,7 +718,7 @@
+          tcp->th_win   = ntohs(thdr->th_win);
+          tcp->th_flags = thdr->th_flags;
+ #else
+-         bcopy ((char *) thdr, (char *)tcp, sizeof(tcpbuf));
++         memcpy((char *) thdr, (char *)tcp, sizeof(tcpbuf));
+ #endif
+ 
+          if (ArgusKeyStroke->status & ARGUS_SSH_KEYSTROKE) {
+@@ -837,19 +837,19 @@
+                                        ArgusDebug (5, "ArgusTCPKeystroke: flow %p packet %lld TENTATIVE packet %lld keystroke ", flowstr, flowstr->skey.n_pkts, tpkt->n_pno);
+ #endif
+                                        flowstr->skey.n_strokes++;
+-                                       bzero(tpkt, sizeof(*tpkt));
++                                       memset(tpkt, 0, sizeof(*tpkt));
+                                     }
+                                  }
+                                  flowstr->skey.prev_pno  = pkt->n_pno;
+                                  flowstr->skey.prev_c_ts = pkt->ts;
+                                  flowstr->skey.prev_s_ts = stime;
+-                                 bzero(pkt, sizeof(*pkt));
++                                 memset(pkt, 0, sizeof(*pkt));
+ 
+                               } else {
+                                  for (i = 0; i < ARGUS_NUM_KEYSTROKE_PKTS; i++) {
+                                     struct ArgusKeyStrokePacket *tpkt = &flowstr->skey.data.pkts[i];
+                                     if (tpkt->status == ARGUS_KEYSTROKE_TENTATIVE)
+-                                       bzero(tpkt, sizeof(*tpkt));
++                                       memset(tpkt, 0, sizeof(*tpkt));
+                                  }
+                                  pkt->status = ARGUS_KEYSTROKE_TENTATIVE;
+ #ifdef ARGUSDEBUG
+@@ -893,9 +893,9 @@
+                      for (i = 0; i < ARGUS_NUM_KEYSTROKE_PKTS; i++) {
+                         struct ArgusKeyStrokePacket *tpkt = &flowstr->skey.data.pkts[i];
+                         if (tpkt->status == ARGUS_KEYSTROKE_TENTATIVE)
+-                           bzero(tpkt, sizeof(*tpkt));
++                           memset(tpkt, 0, sizeof(*tpkt));
+                      }
+-                     bzero(pkt, sizeof(*pkt));
++                     memset(pkt, 0, sizeof(*pkt));
+                   }
+                } 
+ #ifdef ARGUSDEBUG
+diff -Nura argus-3.0.6.1.orig/argus/ArgusUdt.c argus-3.0.6.1/argus/ArgusUdt.c
+--- argus-3.0.6.1.orig/argus/ArgusUdt.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusUdt.c	2014-06-17 11:23:00.376430914 -0300
+@@ -70,11 +70,11 @@
+             }
+ 
+             if (dstgteq) {
+-               bcopy ((char *) ep, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr, sizeof (struct ether_header));
++               memcpy((char *) ep, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr, sizeof (struct ether_header));
+             } else {
+                model->state |= ARGUS_DIRECTION;
+-               bcopy ((char *)&ep->ether_shost, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr.ether_dhost, ETH_ALEN);
+-               bcopy ((char *)&ep->ether_dhost, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr.ether_shost, ETH_ALEN);
++               memcpy((char *)&ep->ether_shost, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr.ether_dhost, ETH_ALEN);
++               memcpy((char *)&ep->ether_dhost, (char *)&tflow->udt_flow.mac.mac_union.ether.ehdr.ether_shost, ETH_ALEN);
+                tflow->udt_flow.mac.mac_union.ether.ehdr.ether_type = ep->ether_type;
+             }
+ 
+diff -Nura argus-3.0.6.1.orig/argus/ArgusUtil.c argus-3.0.6.1/argus/ArgusUtil.c
+--- argus-3.0.6.1.orig/argus/ArgusUtil.c	2014-06-17 11:21:13.096802088 -0300
++++ argus-3.0.6.1/argus/ArgusUtil.c	2014-06-17 11:23:00.335429527 -0300
+@@ -1127,8 +1127,8 @@
+ 
+             case ARGUS_JITTER_INDEX: {
+                struct ArgusJitterStruct *jit = (void *)flow->dsrs[i];
+-               bzero ((char *)&jit->act, sizeof(struct ArgusJitterObject));
+-               bzero ((char *)&jit->idle, sizeof(struct ArgusJitterObject));
++               memset((char *)&jit->act, 0, sizeof(struct ArgusJitterObject));
++               memset((char *)&jit->idle, 0, sizeof(struct ArgusJitterObject));
+                jit->act.src.minval  = -1.0;
+                jit->idle.src.minval = -1.0;
+                jit->act.dst.minval  = -1.0;
+@@ -1146,13 +1146,13 @@
+ 
+             case ARGUS_TIME_INDEX: {
+                struct ArgusTimeObject *tim = (void *)flow->dsrs[i];
+-               bzero(&tim->src, sizeof(*tim) - 4);
++               memset(&tim->src, 0, sizeof(*tim) - 4);
+                break;
+             }
+ 
+             case ARGUS_METRIC_INDEX: {
+                struct ArgusMetricStruct *metric = (void *) flow->dsrs[i];
+-               bzero(metric, sizeof(*metric));
++               memset(metric, 0, sizeof(*metric));
+                break;
+             }
+ 
+@@ -1171,7 +1171,7 @@
+                                  frag->offsets.nxt = fragOffset->nxt;
+                                  free(fragOffset);
+                               }
+-                              bzero((char *)frag, sizeof(struct ArgusFragObject));
++                              memset((char *)frag, 0, sizeof(struct ArgusFragObject));
+                               break;
+                            }
+ 
+@@ -1450,7 +1450,7 @@
+                         ArgusDebug (6, "ArgusHandleClientData: sasl_encode returned %d bytes\n", outputlen);
+ #endif
+                         if (outputlen < ARGUS_MAXRECORD) {
+-                           bcopy(output, asock->buf, outputlen);
++                           memcpy(output, asock->buf, outputlen);
+                            cnt = outputlen;
+                         } else
+                            ArgusLog (LOG_ERR, "sasl_encode: returned too many bytes %d\n", outputlen);
+@@ -1729,7 +1729,7 @@
+                               ArgusDebug (3, "ArgusWriteOutSocket: sasl_encode returned %d bytes\n", outputlen);
+ #endif
+                               if (outputlen < ARGUS_MAXRECORD) {
+-                                 bcopy(output, asock->buf, outputlen);
++                                 memcpy(output, asock->buf, outputlen);
+                                  cnt = outputlen;
+ 
+                               } else
+@@ -2036,7 +2036,7 @@
+    int retn = 0;
+ 
+    if (s1 && s2 && diff) {
+-      bzero ((char *)diff, sizeof(*diff));
++      memset((char *)diff, 0, sizeof(*diff));
+ 
+       double v1 = (s1->tv_sec * 1.0) + (s1->tv_usec / 1000000.0);
+       double v2 = (s2->tv_sec * 1.0) + (s2->tv_usec / 1000000.0);
+diff -Nura argus-3.0.6.1.orig/common/argus_auth.c argus-3.0.6.1/common/argus_auth.c
+--- argus-3.0.6.1.orig/common/argus_auth.c	2014-06-17 11:21:13.101802258 -0300
++++ argus-3.0.6.1/common/argus_auth.c	2014-06-17 11:23:00.436432943 -0300
+@@ -487,12 +487,12 @@
+    char saslbuf[MAXSTRLEN];
+    int len, al = 0;
+ 
+-   bzero (saslbuf, MAXSTRLEN);
++   memset(saslbuf, 0, MAXSTRLEN);
+    
+    snprintf(saslbuf, MAXSTRLEN, "{%d}\r\n", l);
+    len = strlen(saslbuf);
+ 
+-   bcopy (s, &saslbuf[len], l);
++   memcpy(s, &saslbuf[len], l);
+    len += l;
+ 
+    al = fwrite(saslbuf, 1, len, f);
+diff -Nura argus-3.0.6.1.orig/common/argus_code.c argus-3.0.6.1/common/argus_code.c
+--- argus-3.0.6.1.orig/common/argus_code.c	2014-06-17 11:21:13.101802258 -0300
++++ argus-3.0.6.1/common/argus_code.c	2014-06-17 11:23:00.453433518 -0300
+@@ -2557,7 +2557,7 @@
+    int soffset = ((char *)&cocode.src - (char *)&cocode);
+    int doffset = ((char *)&cocode.dst - (char *)&cocode);
+ 
+-   bcopy(v, (char *)&val, sizeof(val));
++   memcpy(v, (char *)&val, sizeof(val));
+ 
+    b0 = Argusgen_cmp(ARGUS_COCODE_INDEX, soffset, NFF_H, 0, Q_EQUAL);
+    Argusgen_not(b0);
+@@ -3877,7 +3877,7 @@
+                   while (host) {
+                      struct sockaddr_in *sa = (struct sockaddr_in *)host->ai_addr;
+                      unsigned int addr[128];
+-                     bcopy ((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
++                     memcpy((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
+ 
+                      switch (host->ai_family) {
+                         case AF_INET:  {
+@@ -3988,7 +3988,7 @@
+          } else {
+ #if defined(HAVE_GETADDRINFO)
+          struct addrinfo hints;
+-         bzero(&hints, sizeof(hints));
++         memset(&hints, 0, sizeof(hints));
+          hints.ai_family = PF_INET;
+          if ((retn = getaddrinfo(name, NULL, &hints, &host)) == 0) {
+             struct addrinfo *hptr = host;
+@@ -3996,7 +3996,7 @@
+             while (host) {
+                struct sockaddr_in *sa = (struct sockaddr_in *)host->ai_addr;
+                unsigned int addr[4];
+-               bcopy ((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
++               memcpy((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
+ 
+                switch (host->ai_family) {
+                   case AF_INET:  {
+@@ -4150,7 +4150,7 @@
+             while (host) {
+                struct sockaddr_in *sa = (struct sockaddr_in *)host->ai_addr;
+                unsigned int addr[4];
+-               bcopy ((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
++               memcpy((char *)&sa->sin_addr, (char *)&addr, host->ai_addrlen);
+ 
+                switch (host->ai_family) {
+                   case AF_INET:  {
+@@ -4287,7 +4287,7 @@
+       if ((cidraddr = RaParseCIDRAddr (ArgusParser, buf)) == NULL)
+          ArgusLog(LOG_ERR, "Argusgen_mcode: CIDR address format error");
+ 
+-      bcopy ((char *)cidraddr, (char *)cidr, sizeof(*cidr));
++      memcpy((char *)cidraddr, (char *)cidr, sizeof(*cidr));
+ 
+       if (s2 != NULL) {
+          if (snprintf (buf, 128, "%s/%d", s2, masklen) >= 128)
+@@ -4295,7 +4295,7 @@
+ 
+          if ((cidraddr = RaParseCIDRAddr (ArgusParser, buf)) == NULL)
+             ArgusLog(LOG_ERR, "Argusgen_mcode: CIDR address format error");
+-         bcopy ((char *)&cidraddr->addr, (char *)&cidr->mask, sizeof(cidr->mask));
++         memcpy((char *)&cidraddr->addr, (char *)&cidr->mask, sizeof(cidr->mask));
+       }
+ 
+       switch (q.addr) {
+diff -Nura argus-3.0.6.1.orig/common/argus_util.c argus-3.0.6.1/common/argus_util.c
+--- argus-3.0.6.1.orig/common/argus_util.c	2014-06-17 11:21:13.101802258 -0300
++++ argus-3.0.6.1/common/argus_util.c	2014-06-17 11:23:00.462433823 -0300
+@@ -197,7 +197,7 @@
+          char pbuf[128];
+          int i;
+ 
+-         bzero(pbuf, sizeof(pbuf));
++         memset(pbuf, 0, sizeof(pbuf));
+          ptid = pthread_self();
+          for (i = 0; i < sizeof(ptid); i++) {
+             snprintf (&pbuf[i*2], 3, "%02hhx", ((char *)&ptid)[i]);
+@@ -821,7 +821,7 @@
+                      char buf[sizeof(*stat)];
+ 
+                      while (len > 0) {
+-                        bcopy ((char *)stat, buf, sizeof(*stat));
++                        memcpy((char *)stat, buf, sizeof(*stat));
+                         xdrmem_create(xdrs, buf, sizeof(*stat), XDR_DECODE);
+                         xdr_int(xdrs, &stat->n);
+                         xdr_float(xdrs, &stat->minval);
+@@ -1371,7 +1371,7 @@
+                         xdr_float(xdrs, &stat->stdev);
+                         xdr_float(xdrs, &stat->maxval);
+ 
+-                        bcopy(buf, stat, sizeof(*stat));
++                        memcpy(buf, stat, sizeof(*stat));
+                         len -= sizeof (*stat);
+                         stat++;
+                      }
+@@ -1956,7 +1956,7 @@
+       char pbuf[128];
+       int i;
+ 
+-      bzero(pbuf, sizeof(pbuf));
++      memset(pbuf, 0, sizeof(pbuf));
+       ptid = pthread_self();
+       for (i = 0; i < sizeof(ptid); i++) {
+          snprintf (&pbuf[i*2], 3, "%02hhx", ((char *)&ptid)[i]);
+@@ -2085,8 +2085,8 @@
+    char *retn = ArgusPrintTimeBuf, *ptr;
+    struct tm *tm, tmbuf;
+ 
+-   bzero (timeZoneBuf, sizeof(timeZoneBuf));
+-   bzero (ArgusPrintTimeBuf, sizeof(ArgusPrintTimeBuf));
++   memset(timeZoneBuf, 0, sizeof(timeZoneBuf));
++   memset(ArgusPrintTimeBuf, 0, sizeof(ArgusPrintTimeBuf));
+ 
+    if ((tm = localtime_r ((time_t *)&tvp->tv_sec, &tmbuf)) != NULL) {
+ #if !defined(HAVE_STRFTIME)
+@@ -2177,7 +2177,7 @@
+    tp->e_addr1 = j;
+    tp->e_addr2 = k;
+    tp->e_nsap = (u_char *) calloc(1, nlen + 1);
+-   bcopy(nsap, tp->e_nsap, nlen + 1);
++   memcpy(nsap, tp->e_nsap, nlen + 1);
+    tp->e_nxt = (struct enamemem *)calloc(1, sizeof(*tp));
+ 
+    return tp;
+@@ -2278,7 +2278,7 @@
+ {
+    struct ArgusEtherTypeStruct *p = argus_ethertype_names;
+ 
+-   bzero ((char *)parser->argus_eproto_db, sizeof (parser->argus_eproto_db));
++   memset((char *)parser->argus_eproto_db, 0, sizeof (parser->argus_eproto_db));
+ 
+    while (p->range != NULL) {
+       int i, start, end;
+@@ -2314,8 +2314,8 @@
+    u_char protoid[5];
+    int i;
+ 
+-   bzero(&protoid, sizeof(protoid));
+-   bzero(&parser->protoidtable, sizeof(parser->protoidtable));
++   memset(&protoid, 0, sizeof(protoid));
++   memset(&parser->protoidtable, 0, sizeof(parser->protoidtable));
+ 
+    for (i = 0; i < ARGUS_MAXEPROTODB; i++) {
+       if ((p = parser->argus_eproto_db[i]) != NULL) {
+@@ -2493,7 +2493,7 @@
+    struct ArgusDSCodePointStruct *argus_dsctable = argus_dscodepoints;
+    int i;
+ 
+-   bzero (&argus_dscodes, sizeof(argus_dscodes));
++   memset(&argus_dscodes, 0, sizeof(argus_dscodes));
+ 
+    if ((argus_dsctable = ArgusSelectDSCodesTable(parser)) != NULL) {
+       for (i = 0; argus_dsctable[i].label != NULL; i++)
+@@ -2853,7 +2853,7 @@
+    char *cp = etheraddrbuf;
+    u_int i, j;
+ 
+-   bzero (cp, sizeof(etheraddrbuf));
++   memset(cp, 0, sizeof(etheraddrbuf));
+    if ((j = *ep >> 4) != 0)
+       *cp++ = hex[j];
+    *cp++ = hex[*ep++ & 0xf];
diff --git a/package/argus/argus-3.0.0.rc.34-00-susv3-legacy.patch b/package/argus/argus-3.0.0.rc.34-00-susv3-legacy.patch
deleted file mode 100644
index a439050..0000000
--- a/package/argus/argus-3.0.0.rc.34-00-susv3-legacy.patch
+++ /dev/null
@@ -1,1278 +0,0 @@
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusApp.c argus-3.0.0.rc.34/argus/ArgusApp.c
---- argus-3.0.0.rc.34.orig/argus/ArgusApp.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusApp.c	2006-12-20 16:21:04.000000000 +0100
-@@ -196,9 +196,9 @@ ArgusUpdateAppState (struct ArgusModeler
-                                     net->hdr.argus_dsrvl8.qual = 0;
-                                     net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusRTCPObject) + 3)/4) + 1;
-                                     if (model->ArgusThisDir) {
--                                       bcopy ((char *) rtcp, (char *)&rtcpObject->src, sizeof(*rtcp));
-+                                       memmove ((char *)&rtcpObject->src, (char *) rtcp, sizeof(*rtcp));
-                                     } else {
--                                       bcopy ((char *) rtcp, (char *)&rtcpObject->dst, sizeof(*rtcp));
-+                                       memmove ((char *)&rtcpObject->dst, (char *) rtcp, sizeof(*rtcp));
-                                     }
- 
-                                  } else {
-@@ -215,9 +215,9 @@ ArgusUpdateAppState (struct ArgusModeler
-                                        rtp->rh_ssrc = ntohl(rtp->rh_ssrc);
- 
-                                        if (model->ArgusThisDir) {
--                                          bcopy ((char *) rtp, (char *)&rtpObject->src, sizeof(*rtp));
-+                                          memmove ((char *)&rtpObject->src, (char *) rtp, sizeof(*rtp));
-                                        } else {
--                                          bcopy ((char *) rtp, (char *)&rtpObject->dst, sizeof(*rtp));
-+                                          memmove ((char *)&rtpObject->dst, (char *) rtp, sizeof(*rtp));
-                                        }
-                                     }
-                                  }
-@@ -301,7 +301,7 @@ ArgusUpdateAppState (struct ArgusModeler
- 
-                   if ((bytes = model->ArgusThisSnapEnd - model->ArgusThisUpHdr) > 0) {
-                      thislen = (thislen > bytes) ? bytes : thislen;
--                     bcopy (model->ArgusThisUpHdr, &((char *)&user->array)[user->count], thislen);
-+                     memmove (&((char *)&user->array)[user->count], model->ArgusThisUpHdr, thislen);
-                      user->count += thislen;
-                   }
-                }
-@@ -358,7 +358,7 @@ ArgusUpdateRTPState (struct ArgusModeler
-                ArgusThisRtpHdr = &rtpObject->dst;
- 
-             if (!(ArgusThisRtpHdr->rh_seq)) {
--               bcopy ((char *) rtp, (char *)ArgusThisRtpHdr, sizeof(*rtp));
-+               memmove ((char *)ArgusThisRtpHdr, (char *) rtp, sizeof(*rtp));
-             } else {
-                if (!(rtp->rh_ssrc) || (ArgusThisRtpHdr->rh_ssrc != rtp->rh_ssrc))
-                   flowstr->dsrs[ARGUS_NETWORK_INDEX] = NULL;
-@@ -404,7 +404,7 @@ ArgusUpdateRTPState (struct ArgusModeler
-                }
-             }
-  
--            bcopy ((char *) rtp, (char *) ArgusThisRtpHdr, sizeof(*rtp));
-+            memmove ((char *) ArgusThisRtpHdr, (char *) rtp, sizeof(*rtp));
-       
-             model->ArgusThisUpHdr = (unsigned char *)(rtp + 1) + offset;
-             model->ArgusThisLength -= (sizeof(struct rtphdr) + offset);
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusArp.c argus-3.0.0.rc.34/argus/ArgusArp.c
---- argus-3.0.0.rc.34.orig/argus/ArgusArp.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusArp.c	2006-12-20 16:12:05.000000000 +0100
-@@ -81,8 +81,8 @@ ArgusCreateArpFlow (struct ArgusModelerS
-          case ARPOP_REQUEST:
-             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_ARP;
-             srcehost = (unsigned char *) &model->ArgusThisEpHdr->ether_shost;
--            bcopy ((char *)&arp->arp_tpa, &arp_tpa, sizeof(arp_tpa));
--            bcopy ((char *)&arp->arp_spa, &arp_spa, sizeof(arp_spa));
-+            memmove (&arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_tpa));
-+            memmove (&arp_spa, (char *)&arp->arp_spa, sizeof(arp_spa));
- #ifdef _LITTLE_ENDIAN
-             arp_spa = ntohl(arp_spa);
-             arp_tpa = ntohl(arp_tpa);
-@@ -90,7 +90,7 @@ ArgusCreateArpFlow (struct ArgusModelerS
-             if (arp_spa > arp_tpa)
-                model->state |= ARGUS_DIRECTION;
- 
--            bcopy (srcehost, retn->arp_flow.etheraddr, sizeof (retn->arp_flow.etheraddr));
-+            memmove (retn->arp_flow.etheraddr, srcehost, sizeof (retn->arp_flow.etheraddr));
- 
-             retn->arp_flow.arp_tpa = arp_tpa;
-             retn->arp_flow.arp_spa = arp_spa;
-@@ -101,8 +101,8 @@ ArgusCreateArpFlow (struct ArgusModelerS
-             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_ARP;
-             srcehost = (unsigned char *) &model->ArgusThisEpHdr->ether_dhost;
- 
--            bcopy ((char *)&arp->arp_spa, &arp_spa, sizeof(arp_tpa));
--            bcopy ((char *)&arp->arp_tpa, &arp_tpa, sizeof(arp_spa));
-+            memmove (&arp_spa, (char *)&arp->arp_spa, sizeof(arp_tpa));
-+            memmove (&arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_spa));
- #ifdef _LITTLE_ENDIAN
-             arp_spa = ntohl(arp_spa);
-             arp_tpa = ntohl(arp_tpa);
-@@ -111,7 +111,7 @@ ArgusCreateArpFlow (struct ArgusModelerS
-             if (arp_tpa > arp_spa)
-                model->state |= ARGUS_DIRECTION;
-    
--            bcopy (srcehost, retn->arp_flow.etheraddr, sizeof (retn->arp_flow.etheraddr));
-+            memmove (retn->arp_flow.etheraddr, srcehost, sizeof (retn->arp_flow.etheraddr));
- 
-             retn->arp_flow.arp_tpa = arp_tpa;
-             retn->arp_flow.arp_spa = arp_spa;
-@@ -120,29 +120,29 @@ ArgusCreateArpFlow (struct ArgusModelerS
- 
-          case REVARP_REQUEST:
-             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_RARP;
--            bcopy ((char *)&arp->arp_tpa, &arp_tpa, sizeof(arp_tpa));
-+            memmove (&arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_tpa));
- #ifdef _LITTLE_ENDIAN
-             arp_tpa = ntohl(arp_tpa);
- #endif
- 
-             srcehost = (unsigned char *)&THA(arp);
-             tarehost = (unsigned char *)&SHA(arp);
--            bcopy ((char *)&arp->arp_tpa, &retn->rarp_flow.arp_tpa, sizeof(arp_tpa));
--            bcopy (srcehost, retn->rarp_flow.srceaddr, sizeof (retn->rarp_flow.srceaddr));
--            bcopy (tarehost, retn->rarp_flow.tareaddr, sizeof (retn->rarp_flow.tareaddr));
-+            memmove (&retn->rarp_flow.arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_tpa));
-+            memmove (retn->rarp_flow.srceaddr, srcehost, sizeof (retn->rarp_flow.srceaddr));
-+            memmove (retn->rarp_flow.tareaddr, tarehost, sizeof (retn->rarp_flow.tareaddr));
-             break;
- 
-          case REVARP_REPLY:
-             retn->hdr.argus_dsrvl8.qual = ARGUS_TYPE_RARP;
--            bcopy ((char *)&arp->arp_tpa, &arp_tpa, sizeof(arp_tpa));
-+            memmove (&arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_tpa));
- #ifdef _LITTLE_ENDIAN
-             arp_tpa = ntohl(arp_tpa);
- #endif
-             srcehost = (unsigned char *)&SHA(arp);
-             tarehost = (unsigned char *)&THA(arp);
--            bcopy ((char *)&arp->arp_tpa, &retn->rarp_flow.arp_tpa, sizeof(arp_tpa));
--            bcopy (srcehost, retn->rarp_flow.srceaddr, sizeof (retn->rarp_flow.srceaddr));
--            bcopy (tarehost, retn->rarp_flow.tareaddr, sizeof (retn->rarp_flow.tareaddr));
-+            memmove (&retn->rarp_flow.arp_tpa, (char *)&arp->arp_tpa, sizeof(arp_tpa));
-+            memmove (retn->rarp_flow.srceaddr, srcehost, sizeof (retn->rarp_flow.srceaddr));
-+            memmove (retn->rarp_flow.tareaddr, tarehost, sizeof (retn->rarp_flow.tareaddr));
-             break;
-       }
-    }
-@@ -177,7 +177,7 @@ ArgusUpdateArpState (struct ArgusModeler
-             break;
- 
-          case ARPOP_REPLY:
--            bcopy ((unsigned char *)&SHA(arp), arpobj->respaddr, 6);
-+            memmove (arpobj->respaddr, (unsigned char *)&SHA(arp), 6);
-             break;
-       }
-    }
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusEsp.c argus-3.0.0.rc.34/argus/ArgusEsp.c
---- argus-3.0.0.rc.34.orig/argus/ArgusEsp.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusEsp.c	2006-12-20 15:57:17.000000000 +0100
-@@ -123,7 +123,7 @@ ArgusUpdateESPState (struct ArgusModeler
- 
-          flowstr->dsrs[ARGUS_NETWORK_INDEX] = (void *) net;
- 
--         bzero ((char *)espObj, sizeof(*espObj));
-+         memset ((char *)espObj, 0, sizeof(*espObj));
-          flowstr->timeout = ARGUS_IPTIMEOUT;
- 
-          espObj->spi     = esp->spi;
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusFrag.c argus-3.0.0.rc.34/argus/ArgusFrag.c
---- argus-3.0.0.rc.34.orig/argus/ArgusFrag.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusFrag.c	2006-12-20 16:18:25.000000000 +0100
-@@ -232,7 +232,7 @@ ArgusUpdateFRAGState (struct ArgusModele
-                            if (prvfragOffset != NULL) {
-                               prvfragOffset->nxt = fragOffset->nxt;
-                            } else {
--                              bcopy((char *) fragOffset->nxt , (char *)&frag->offsets, sizeof(frag->offsets));
-+                              memmove((char *)&frag->offsets, (char *) fragOffset->nxt, sizeof(frag->offsets));
-                            }
- /* else just update the prv fragments pointer to toss this one */
-                         } else {
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusIcmp.c argus-3.0.0.rc.34/argus/ArgusIcmp.c
---- argus-3.0.0.rc.34.orig/argus/ArgusIcmp.c	2006-10-30 19:26:51.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusIcmp.c	2006-12-20 16:07:09.000000000 +0100
-@@ -159,8 +159,9 @@ ArgusCreateICMPFlow (struct ArgusModeler
- 
-                         case ICMP_UNREACH_NET:
-                         case ICMP_UNREACH_HOST:
--                           bcopy ((char *) &icmp->icmp_ip.ip_dst.s_addr,
--                                           (char *)&icmpFlow->id, sizeof (int));
-+                           memmove ((char *)&icmpFlow->id,
-+					   (char*) &icmp->icmp_ip.ip_dst.s_addr,
-+                                           sizeof (int));
-                            break;
-                      }
-                      break;
-@@ -174,7 +175,7 @@ ArgusCreateICMPFlow (struct ArgusModeler
- 
-                         case ICMP_REDIRECT_NET:
-                         case ICMP_REDIRECT_HOST:
--                           bcopy ((char *) &icmp->icmp_ip.ip_dst.s_addr, (char *)&icmpFlow->id, sizeof (int));
-+                           memmove ((char *)&icmpFlow->id, (char *) &icmp->icmp_ip.ip_dst.s_addr, sizeof (int));
-                            break;
-                      }
-                      break;
-@@ -220,7 +221,7 @@ ArgusUpdateICMPState (struct ArgusModele
-          net->hdr.subtype          = ARGUS_ICMP_DSR;
-          net->hdr.argus_dsrvl8.qual = 0;
-          net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusICMPObject)+3))/4 + 1;
--         bzero ((char *)icmpObj, sizeof(*icmpObj));
-+         memset ((char *)icmpObj, 0, sizeof(*icmpObj));
- 
-          icmpObj->icmp_type = icmp->icmp_type;
-          icmpObj->icmp_code = icmp->icmp_code;
-@@ -314,7 +315,7 @@ ArgusUpdateICMPState (struct ArgusModele
-                   }
- 
-                   dsr->argus_dsrvl8.len  = (sizeof (struct ArgusIcmpStruct) + 3)/4 + 1;
--                  bcopy ((char *) icmpObj, (char *) (dsr + 1), sizeof (*icmpObj));
-+                  memmove ((char *) (dsr + 1), (char *) icmpObj, sizeof (*icmpObj));
-                   flow->dsrs[ARGUS_ICMP_INDEX] = dsr;
-                   flow->dsrindex |= 1 << ARGUS_ICMP_INDEX;
- 
-@@ -361,7 +362,7 @@ ArgusUpdateICMPv6State (struct ArgusMode
-          net->hdr.subtype          = ARGUS_ICMP_DSR;
-          net->hdr.argus_dsrvl8.qual = 0;
-          net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusICMPObject)+3))/4 + 1;
--         bzero ((char *)icmpObj, sizeof(*icmpObj));
-+         memset ((char *)icmpObj, 0, sizeof(*icmpObj));
- 
-          icmpObj->icmp_type = icmpv6->icmp6_type;
-          icmpObj->icmp_code = icmpv6->icmp6_code;
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusMac.c argus-3.0.0.rc.34/argus/ArgusMac.c
---- argus-3.0.0.rc.34.orig/argus/ArgusMac.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusMac.c	2006-12-20 16:18:44.000000000 +0100
-@@ -44,7 +44,7 @@ ArgusMacFlowRecord (struct ArgusFlowStru
-    struct ArgusMacStruct *mac = (struct ArgusMacStruct *) flowstr->MacDSRBuffer;
-       
-    if (mac && ((length = argus->ahdr.length) > 0)) {
--      bcopy ((char *)mac, &((char *)argus)[argus->ahdr.length], sizeof(*mac));
-+      memmove (&((char *)argus)[argus->ahdr.length], (char *)mac, sizeof(*mac));
-       argus->ahdr.length += sizeof(*mac);
-    }
- }
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusModeler.c argus-3.0.0.rc.34/argus/ArgusModeler.c
---- argus-3.0.0.rc.34.orig/argus/ArgusModeler.c	2006-09-26 06:28:16.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusModeler.c	2006-12-20 16:17:19.000000000 +0100
-@@ -112,7 +112,7 @@ void *ArgusQueueManager(void *);
- void
- ArgusInitModeler(struct ArgusModelerStruct *model)
- {
--   bzero (model->ArgusTimeOutQueues, sizeof(model->ArgusTimeOutQueues));
-+   memset (model->ArgusTimeOutQueues, 0, sizeof(model->ArgusTimeOutQueues));
-    model->ArgusInProtocol = 1;
-    model->ArgusUpdateInterval.tv_usec = 200000;
-    model->ArgusMajorVersion = VERSION_MAJOR;
-@@ -525,7 +525,7 @@ ArgusProcessPacketHdrs (struct ArgusMode
-                model->ArgusThisEncaps |= ARGUS_ENCAPS_LLC;
- 
-                llc = model->ArgusThisLLC;
--               bcopy((char *) ptr, (char *) llc, sizeof (struct llc));
-+               memmove((char *) llc, (char *) ptr, sizeof (struct llc));
- 
- #define ARGUS_IPX_TAG         100
- 
-@@ -772,7 +772,7 @@ ArgusProcessEtherHdr (struct ArgusModele
-          model->ArgusThisEncaps |= ARGUS_ENCAPS_LLC;
- 
-          llc = model->ArgusThisLLC;
--         bcopy((char *) ptr, (char *) llc, sizeof (struct llc));
-+         memmove((char *) llc, (char *) ptr, sizeof (struct llc));
- 
- #define ARGUS_IPX_TAG         100
- 
-@@ -1314,11 +1314,11 @@ ArgusCreateFlow (struct ArgusModelerStru
-                   }
- 
-                   if (dstgteq) {
--                     bcopy ((char *) ep, (char *)&model->ArgusThisFlow->mac_flow.ehdr, sizeof (struct ether_header));
-+                     memmove ((char *)&model->ArgusThisFlow->mac_flow.ehdr, (char *) ep, sizeof (struct ether_header));
-                   } else {
-                      model->state |= ARGUS_DIRECTION;
--                     bcopy ((char *)&ep->ether_shost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, ETH_ALEN);
--                     bcopy ((char *)&ep->ether_dhost, (char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, ETH_ALEN);
-+                     memmove ((char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_dhost, (char *)&ep->ether_shost, ETH_ALEN);
-+                     memmove ((char *)&model->ArgusThisFlow->mac_flow.ehdr.ether_shost, (char *)&ep->ether_dhost, ETH_ALEN);
-                      model->ArgusThisFlow->mac_flow.ehdr.ether_type = ep->ether_type;
-                   }
- 
-@@ -1418,7 +1418,7 @@ ArgusNewFlow (struct ArgusModelerStruct 
-       retn->qhdr.qtime.tv_sec  = 0;
-       retn->qhdr.qtime.tv_usec = 0;
- 
--      bzero ((char *)retn->dsrs, sizeof(retn->dsrs));
-+      memset ((char *)retn->dsrs, 0, sizeof(retn->dsrs));
- 
-       retn->dsrs[ARGUS_TRANSPORT_INDEX] = &retn->canon.trans.hdr;
-       trans = (struct ArgusTransportStruct *) retn->dsrs[ARGUS_TRANSPORT_INDEX];
-@@ -1429,7 +1429,7 @@ ArgusNewFlow (struct ArgusModelerStruct 
- 
-       retn->dsrs[ARGUS_TIME_INDEX] = (struct ArgusDSRHeader *) &retn->canon.time.hdr;
-       dtime = (struct ArgusTimeObject *) retn->dsrs[ARGUS_TIME_INDEX];
--      bzero((char *)dtime, sizeof(*dtime));
-+      memset((char *)dtime, 0, sizeof(*dtime));
-       dtime->hdr.type            = ARGUS_TIME_DSR;
-       dtime->hdr.subtype         = ARGUS_TIME_ABSOLUTE_TIMESTAMP;
-       dtime->hdr.argus_dsrvl8.qual = ARGUS_TYPE_UTC_MICROSECONDS;
-@@ -1446,10 +1446,10 @@ ArgusNewFlow (struct ArgusModelerStruct 
-       retn->dsrs[ARGUS_FLOW_INDEX] = (struct ArgusDSRHeader *) &retn->canon.flow.hdr;
-       retn->canon.flow.hdr = flow->hdr;
- 
--      bcopy ((char *)&flow->flow_un, (char *)&retn->canon.flow.flow_un, (flow->hdr.argus_dsrvl8.len - 1) * 4);
-+      memmove ((char *)&retn->canon.flow.flow_un, (char *)&flow->flow_un, (flow->hdr.argus_dsrvl8.len - 1) * 4);
-       retn->dsrindex |= 1 << ARGUS_FLOW_INDEX;
- 
--      bzero ((char *)&retn->canon.metric, sizeof(retn->canon.metric));
-+      memset ((char *)&retn->canon.metric, 0, sizeof(retn->canon.metric));
- /*
-       if (retn->status & ARGUS_DIRECTION)
-          retn->dsrs[ARGUS_FLOW_INDEX]->subtype |= ARGUS_REVERSE;
-@@ -1573,7 +1573,7 @@ ArgusUpdateBasicFlow (struct ArgusModele
-          mac->hdr.argus_dsrvl8.len    = 5;
- 
-          if (model->ArgusThisEpHdr != NULL)
--            bcopy ((char *)model->ArgusThisEpHdr, (char *)&mac->mac_union.ether, sizeof(struct ether_header));
-+            memmove ((char *)&mac->mac_union.ether, (char *)model->ArgusThisEpHdr, sizeof(struct ether_header));
- 
-          flow->dsrindex |= 1 << ARGUS_MAC_INDEX;
- 
-@@ -1652,8 +1652,8 @@ ArgusUpdateBasicFlow (struct ArgusModele
-          jitter->hdr.argus_dsrvl8.len       = 1;
-          flow->dsrindex |= 1 << ARGUS_JITTER_INDEX;
- 
--         bzero((char *)&jitter->act,  sizeof(struct ArgusJitterObject));
--         bzero((char *)&jitter->idle, sizeof(struct ArgusJitterObject));
-+         memset((char *)&jitter->act, 0, sizeof(struct ArgusJitterObject));
-+         memset((char *)&jitter->idle, 0, sizeof(struct ArgusJitterObject));
- 
-          memset(&flow->stime.act,  0, sizeof(flow->stime.act));
-          memset(&flow->stime.idle, 0, sizeof(flow->stime.idle));
-@@ -2094,7 +2094,7 @@ ArgusGenerateRecord (struct ArgusModeler
-          int i, x, len = 0, type = 0, dsrlen = 1;
-          struct ArgusDSRHeader *dsr;
- 
--         bcopy ((char *)&rec->hdr, (char *)&retn->hdr, sizeof(retn->hdr));
-+         memmove ((char *)&retn->hdr, (char *)&rec->hdr, sizeof(retn->hdr));
-          dsrptr = (unsigned int *)&retn->ar_un.mar;
- 
-          if ((rec->canon.trans.seqnum = model->ArgusSeqNum++) == 0xFFFFFFFF)
-@@ -2441,7 +2441,7 @@ ArgusGenerateRecord (struct ArgusModeler
-          retn->hdr.len = dsrlen;
- 
-       } else  {
--         bcopy ((char *)&rec->canon, (char *) retn, rec->hdr.len * 4);
-+         memmove ((char *) retn, (char *)&rec->canon, rec->hdr.len * 4);
-          retn->hdr = rec->hdr;
-       }
-          
-@@ -2470,8 +2470,8 @@ ArgusCopyRecordStruct (struct ArgusRecor
- 
-    if (rec) {
-       if ((retn = (struct ArgusRecordStruct *) ArgusMallocListRecord (sizeof(*retn))) != NULL) {
--         bcopy ((char *)&rec->hdr, (char *)&retn->hdr, sizeof (rec->hdr));
--         bcopy ((char *)&rec->canon, (char *)&retn->canon, sizeof (rec->canon));
-+         memmove ((char *)&retn->hdr, (char *)&rec->hdr, sizeof (rec->hdr));
-+         memmove ((char *)&retn->canon, (char *)&rec->canon, sizeof (rec->canon));
- 
-          if ((retn->dsrindex = rec->dsrindex)) {
-             for (i = 0; i < ARGUSMAXFLOWTYPE; i++) {
-@@ -2494,7 +2494,7 @@ ArgusCopyRecordStruct (struct ArgusRecor
-                         struct ArgusDataStruct *user = (struct ArgusDataStruct *) rec->dsrs[i];
-                         if (user->count > 0) {
-                            if ((retn->dsrs[i] = (void *) ArgusCalloc(1, (8 + user->size))) != NULL) {
--                              bcopy ((char *)rec->dsrs[i], (char *)retn->dsrs[i], 8 + user->size);
-+                              memmove ((char *)retn->dsrs[i], (char *)rec->dsrs[i], 8 + user->size);
-                            } else {
-                               retn->dsrindex &= ~(0x01 << i);
-                            }
-@@ -2541,7 +2541,7 @@ ArgusGenerateListRecord (struct ArgusMod
- 
-    if ((retn = (struct ArgusRecordStruct *) ArgusMallocListRecord (sizeof(*retn))) != NULL) {
-       if (flow) {
--         bcopy ((char *)&flow->canon, (char *)&retn->canon, sizeof (flow->canon));
-+         memmove ((char *)&retn->canon, (char *)&flow->canon, sizeof (flow->canon));
-          if ((retn->dsrindex = flow->dsrindex) != 0) {
-             for (i = 0; i < ARGUSMAXFLOWTYPE; i++) {
-                if (flow->dsrs[i] != NULL) {
-@@ -2691,8 +2691,8 @@ ArgusGenerateListRecord (struct ArgusMod
- 
-       } else {
-          retn->dsrindex = 0;
--         bzero ((char *)&retn->canon, sizeof(retn->canon));
--         bzero ((char *)retn->dsrs, sizeof(retn->dsrs));
-+         memset ((char *)&retn->canon, 0, sizeof(retn->canon));
-+         memset ((char *)retn->dsrs, 0, sizeof(retn->dsrs));
-       }
- 
-       if (!(flow) && ((state == ARGUS_STOP) || (state == ARGUS_ERROR))) {
-@@ -3017,7 +3017,7 @@ ArgusCreateIPv4Flow (struct ArgusModeler
-       model->ArgusSnapLength -= hlen;
- 
-       if (model->ArgusFlowKey & ARGUS_FLOW_KEY_CLASSIC5TUPLE) {
--         bzero ((char *)model->ArgusThisFlow, sizeof(*model->ArgusThisFlow));
-+         memset ((char *)model->ArgusThisFlow, 0, sizeof(*model->ArgusThisFlow));
-          model->ArgusThisFlow->hdr.type             = ARGUS_FLOW_DSR;
-          model->ArgusThisFlow->hdr.subtype          = ARGUS_FLOW_CLASSIC5TUPLE;
-          model->ArgusThisFlow->hdr.argus_dsrvl8.qual = ARGUS_TYPE_IPV4;
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusOutput.c argus-3.0.0.rc.34/argus/ArgusOutput.c
---- argus-3.0.0.rc.34.orig/argus/ArgusOutput.c	2006-10-16 21:57:15.000000000 +0200
-+++ argus-3.0.0.rc.34/argus/ArgusOutput.c	2006-12-20 16:21:26.000000000 +0100
-@@ -530,7 +530,7 @@ ArgusEstablishListen (struct ArgusOutput
- #endif
-          if ((host = gethostbyname (bindIP)) != NULL) {
-             if ((host->h_addrtype == AF_INET) && (host->h_length == 4)) {
--               bcopy ((char *) *host->h_addr_list, (char *)&sin.sin_addr.s_addr, host->h_length);
-+               memmove ((char *)&sin.sin_addr.s_addr, (char *) *host->h_addr_list, host->h_length);
-             } else
-                ArgusLog (LOG_ERR, "ArgusEstablishListen() unsupported bind address %s", bindIP);
-          } else
-@@ -600,7 +600,7 @@ ArgusCheckClientStatus (struct ArgusOutp
-             if (output->clientnum < ARGUS_MAXLISTEN) {
-                int i = output->clientnum++;
- 
--               bzero(&output->clients[i], sizeof(output->clients[i]));
-+               memset(&output->clients[i], 0, sizeof(output->clients[i]));
-                output->clients[i].fd = fd;
- #ifdef ARGUSDEBUG
-                ArgusDebug (2, "ArgusCheckClientStatus() new client %d\n", i);
-@@ -754,7 +754,7 @@ ArgusCheckClientMessage (struct ArgusOut
-          ArgusLog (LOG_ERR, "ArgusCheckClientMessage(0x%x, %d) sasl_getprop %s\n", client, fd, strerror(errno));
- #endif /* ARGUS_SASL */
- 
--   bzero(buf, MAXSTRLEN);
-+   memset(buf, 0, MAXSTRLEN);
- 
-    if (value == 0)
-       value = MAXSTRLEN;
-@@ -791,8 +791,8 @@ ArgusCheckClientMessage (struct ArgusOut
- #endif
-       if (outputlen > 0) {
-          if (outputlen < MAXSTRLEN) {
--            bzero (buf, MAXSTRLEN);
--            bcopy (outputbuf, buf, outputlen);
-+            memset (buf, 0, MAXSTRLEN);
-+            memmove (buf, outputbuf, outputlen);
-             cnt = outputlen;
-          } else
-             ArgusLog (LOG_ERR, "ArgusCheckClientMessage(0x%x, %d) sasl_decode returned %d bytes\n", client, fd, outputlen);
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusSource.c argus-3.0.0.rc.34/argus/ArgusSource.c
---- argus-3.0.0.rc.34.orig/argus/ArgusSource.c	2006-10-30 19:53:29.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusSource.c	2006-12-20 16:05:50.000000000 +0100
-@@ -92,11 +92,11 @@ ArgusInitSource (struct ArgusSourceStruc
- 
-    src->ArgusInterfaces = 0;
-    for (i = 0; i < ARGUS_MAXINTERFACE; i++)
--      bzero ((char *)&src->ArgusInterface[i], sizeof(struct ArgusInterfaceStruct));
-+      memset ((char *)&src->ArgusInterface[i], 0, sizeof(struct ArgusInterfaceStruct));
- 
-    if (src->ArgusRfileList != NULL) {
-       setuid(getuid());
--      bzero(errbuf, sizeof(errbuf));
-+      memset(errbuf, 0, sizeof(errbuf));
- 
-       if (ArgusOpenInputPacketFile(src, errbuf) == 0) {
-       }
-@@ -156,7 +156,7 @@ ArgusInitSource (struct ArgusSourceStruc
-       src->ArgusInputFilter = cmdbuf;
-    }
- 
--   bzero ((char *) &src->ArgusInterface[0].ArgusFilter, sizeof (struct bpf_program));
-+   memset ((char *) &src->ArgusInterface[0].ArgusFilter, 0, sizeof (struct bpf_program));
- 
-    if (pcap_compile (src->ArgusInterface[0].ArgusPd, &src->ArgusInterface[0].ArgusFilter, src->ArgusInputFilter, getArgusOflag(src), src->ArgusInterface[0].ArgusNetMask) < 0)
-       ArgusLog (LOG_ERR, "%s\n", pcap_geterr (src->ArgusInterface[0].ArgusPd));
-@@ -421,7 +421,7 @@ ArgusMoatTshRead (struct ArgusSourceStru
-    int retn = 0, length = 0;
-    struct ip *iphdr = NULL;
- 
--   bzero (ArgusMoatPktHdr, sizeof(MoatTshBuffer));
-+   memset (ArgusMoatPktHdr, 0, sizeof(MoatTshBuffer));
-  
-    if ((retn = read(pcap_fileno(src->ArgusInterface[0].ArgusPd), ArgusMoatPktHdr, ARGUSMOATLEN)) == ARGUSMOATLEN) {
-       ArgusMoatPktHdr->interface = 0;
-@@ -666,7 +666,7 @@ ArgusArcnetPacket (u_char *user, const s
-    caplen -= archdrlen;
-    p += archdrlen;
-    
--   bcopy (p, (char *)ep, caplen);
-+   memmove ((char *)ep, p, caplen);
- 
-    src->ArgusModel->ArgusThisLength  = length;
-    src->ArgusModel->ArgusSnapLength  = caplen;
-@@ -973,8 +973,8 @@ Argusextract_fddi_addrs(const struct fdd
-          fsrc[i] = fddi_bit_swap[fp->fddi_shost[i]];
-    }
-    else {
--      bcopy ((char *) fp->fddi_dhost, fdst, 6);
--      bcopy ((char *) fp->fddi_shost, fsrc, 6);
-+      memmove (fdst, (char *) fp->fddi_dhost, 6);
-+      memmove (fsrc, (char *) fp->fddi_shost, 6);
-    }
- }
- 
-@@ -994,7 +994,7 @@ ArgusCreatePktFromFddi(const struct fddi
-          ((struct ether_header *) ep)->ether_type = EXTRACT_16BITS(&llc->ethertype[0]);
-          ptr = (unsigned char *)(llc + 1);
-          length -= (sizeof(struct fddi_header) + sizeof(struct llc));
--         bcopy ((char *)ptr, (char *)(ep + 1), length);
-+         memmove ((char *)(ep + 1), (char *)ptr, length);
-          retn = length + sizeof(struct ether_header);
-       }
-    }
-@@ -1099,7 +1099,7 @@ ArgusATMPacket(u_char *user, const struc
-    caplen -= ARGUS_ATM_HDR_OFFSET;
-    p += ARGUS_ATM_HDR_OFFSET;
-    
--   bcopy (p, (char *)(ep + 1), caplen);
-+   memmove ((char *)(ep + 1), p, caplen);
- 
-    length += sizeof(*ep);
-    caplen += sizeof(*ep);
-@@ -1752,7 +1752,7 @@ ArgusGetInterfaceStatus (struct ArgusSou
-    if (strstr(device->name, "dag")) {
-       for (i = 0; i < src->ArgusInterfaces; i++) {
-          if (src->ArgusInterface[i].ArgusPd && (pcap_fileno(src->ArgusInterface[i].ArgusPd) > 0))
--            bzero ((char *)&src->ArgusInterface[i].ifr, sizeof(ifr));
-+            memset ((char *)&src->ArgusInterface[i].ifr, 0, sizeof(ifr));
- 
-          src->ArgusInterface[i].ifr.ifr_flags |= IFF_UP;
-          setArgusInterfaceStatus(src, 1);
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusTcp.c argus-3.0.0.rc.34/argus/ArgusTcp.c
---- argus-3.0.0.rc.34.orig/argus/ArgusTcp.c	2006-10-30 19:07:13.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusTcp.c	2006-12-20 16:17:49.000000000 +0100
-@@ -89,7 +89,7 @@ ArgusUpdateTCPState (struct ArgusModeler
-          net->hdr.argus_dsrvl8.len  = ((sizeof(struct ArgusTCPObject)+3))/4 + 1;
-          flowstr->dsrs[ARGUS_NETWORK_INDEX] = (struct ArgusDSRHeader *) net;
-          tcpExt                    = &net->net_union.tcp;
--         bzero ((char *)tcpExt, sizeof(*tcpExt));
-+         memset ((char *)tcpExt, 0, sizeof(*tcpExt));
- 
-          model->ArgusSnapLength -= tcphlen;
-          model->ArgusThisLength  = tcpdatalen;
-@@ -287,7 +287,7 @@ ArgusInitializeTCP (struct ArgusModelerS
- {
-    struct ArgusTCPObject *tcpExt = (struct ArgusTCPObject *)&flow->canon.net.net_union.tcp;
- 
--   bzero ((char *)tcpExt, sizeof(*tcpExt));
-+   memset ((char *)tcpExt, 0, sizeof(*tcpExt));
- 
-    flow->qhdr.lasttime.tv_sec  = 0;
-    flow->qhdr.lasttime.tv_usec = 0;
-@@ -684,7 +684,7 @@ ArgusTCPFlowRecord (struct ArgusNetworkS
-          tcpExt->dst.ackbytes++;
- 
-       if (tcp && ((length = argus->hdr.len) > 0)) {
--         bcopy ((char *)tcp, &((char *)argus)[length], sizeof(*tcp));
-+         memmove (&((char *)argus)[length], (char *)tcp, sizeof(*tcp));
-          argus->hdr.len += sizeof(*tcp);
-       }
- 
-diff -rup argus-3.0.0.rc.34.orig/argus/ArgusUtil.c argus-3.0.0.rc.34/argus/ArgusUtil.c
---- argus-3.0.0.rc.34.orig/argus/ArgusUtil.c	2006-11-03 18:44:23.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusUtil.c	2006-12-20 16:19:14.000000000 +0100
-@@ -854,8 +854,8 @@ ArgusZeroRecord (struct ArgusFlowStruct 
- 
-             case ARGUS_JITTER_INDEX: {
-                struct ArgusJitterStruct *jit = (void *)flow->dsrs[i];
--               bzero ((char *)&jit->act, sizeof(struct ArgusJitterObject));
--               bzero ((char *)&jit->idle, sizeof(struct ArgusJitterObject));
-+               memset ((char *)&jit->act, 0, sizeof(struct ArgusJitterObject));
-+               memset ((char *)&jit->idle, 0, sizeof(struct ArgusJitterObject));
-                jit->act.src.minval  = 0xffffffff;
-                jit->idle.src.minval = 0xffffffff;
-                jit->act.dst.minval  = 0xffffffff;
-@@ -1105,7 +1105,7 @@ ArgusWriteSocket (struct ArgusOutputStru
-                   ArgusDebug (3, "ArgusHandleClientData: sasl_encode returned %d bytes\n", outputlen);
- #endif
-                   if (outputlen < ARGUS_MAXRECORD) {
--                     bcopy(output, asock->buf, outputlen);
-+                     memmove(asock->buf, output, outputlen);
-                      cnt = outputlen;
-                   } else
-                      ArgusLog (LOG_ERR, "sasl_encode: returned too many bytes %d\n", outputlen);
-@@ -1282,7 +1282,7 @@ ArgusWriteOutSocket (struct ArgusOutputS
-                         ArgusDebug (3, "ArgusHandleClientData: sasl_encode returned %d bytes\n", outputlen);
- #endif
-                         if (outputlen < ARGUS_MAXRECORD) {
--                           bcopy(output, asock->buf, outputlen);
-+                           memmove(asock->buf, output, outputlen);
-                            cnt = outputlen;
- 
-                         } else
-diff -rup argus-3.0.0.rc.34.orig/argus/argus.c argus-3.0.0.rc.34/argus/argus.c
---- argus-3.0.0.rc.34.orig/argus/argus.c	2006-11-03 19:54:13.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/argus.c	2006-12-20 16:12:47.000000000 +0100
-@@ -303,7 +303,7 @@ main (int argc, char *argv[])
-               if ((host = gethostbyname(optarg)) != NULL) {
-                  if ((host->h_addrtype == 2) && (host->h_length == 4)) {
-                     unsigned int addr;
--                    bcopy ((char *) *host->h_addr_list, (char *)&addr, host->h_length);
-+                    memmove ((char *)&addr, (char *) *host->h_addr_list, host->h_length);
- #if defined(_LITTLE_ENDIAN)
-                     setArgusID (ArgusModel, ntohl(addr));
- #else
-@@ -499,7 +499,7 @@ ArgusComplete ()
-    if (ArgusSourceTask->ArgusStartTime.tv_sec == 0)
-       ArgusSourceTask->ArgusStartTime = ArgusSourceTask->ArgusEndTime;
- 
--   bzero(buf, sizeof(buf));
-+   memset(buf, 0, sizeof(buf));
- 
-    timediff.tv_sec  = ArgusSourceTask->ArgusEndTime.tv_sec  - ArgusSourceTask->ArgusStartTime.tv_sec;
-    timediff.tv_usec = ArgusSourceTask->ArgusEndTime.tv_usec - ArgusSourceTask->ArgusStartTime.tv_usec;
-@@ -784,7 +784,7 @@ ArgusParseResourceFile (struct ArgusMode
-                               if ((host = gethostbyname(optarg)) != NULL) {
-                                  if ((host->h_addrtype == 2) && (host->h_length == 4)) {
-                                     unsigned int addr;
--                                    bcopy ((char *) *host->h_addr_list, (char *)&addr, host->h_length);
-+                                    memmove ((char *)&addr, (char *) *host->h_addr_list, host->h_length);
- #if defined(_LITTLE_ENDIAN)
-                                     setArgusID (model, ntohl(addr));
- #else
-diff -rup argus-3.0.0.rc.34.orig/common/argus_auth.c argus-3.0.0.rc.34/common/argus_auth.c
---- argus-3.0.0.rc.34.orig/common/argus_auth.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/common/argus_auth.c	2006-12-20 16:56:47.000000000 +0100
-@@ -473,12 +473,12 @@ RaSendSaslString (FILE *f, const char *s
-    char saslbuf[MAXSTRLEN];
-    int len, al = 0;
- 
--   bzero (saslbuf, MAXSTRLEN);
-+   memset (saslbuf, 0, MAXSTRLEN);
-    
-    snprintf(saslbuf, MAXSTRLEN, "{%d}\r\n", l);
-    len = strlen(saslbuf);
- 
--   bcopy (s, &saslbuf[len], l);
-+   memmove (&saslbuf[len], s, l);
-    len += l;
- 
-    al = fwrite(saslbuf, 1, len, f);
-diff -rup argus-3.0.0.rc.34.orig/common/argus_parse.c argus-3.0.0.rc.34/common/argus_parse.c
---- argus-3.0.0.rc.34.orig/common/argus_parse.c	2006-08-18 19:15:14.000000000 +0200
-+++ argus-3.0.0.rc.34/common/argus_parse.c	2006-12-20 16:56:34.000000000 +0100
-@@ -80,7 +80,7 @@ argus_parse_init (struct ARGUS_INPUT *in
-    if (input != NULL)
-       fd = input->fd;
- 
--   bzero((char *)&ArgusOutputFile, sizeof(ArgusOutputFile));
-+   memset((char *)&ArgusOutputFile, 0, sizeof(ArgusOutputFile));
- 
-    if (initCon) {
-       if (initCon->ahdr.status & ARGUS_DETAIL) detail++;
-@@ -496,8 +496,8 @@ main (int argc, char **argv)
-       *RaInputFilter = cmdbuf;
-    }
- 
--   bzero ((char *) &ArgusFilterCode, sizeof (ArgusFilterCode));
--   bzero ((char *) &pbuf, sizeof (pbuf));
-+   memset ((char *) &ArgusFilterCode, 0, sizeof (ArgusFilterCode));
-+   memset ((char *) &pbuf, 0, sizeof (pbuf));
- 
-    if (ArgusFilterCompile (&pbuf, &ArgusFilterCode, *RaInputFilter, 1, ArgusNetMask) < 0) {
-       if (pbuf.errbuf[0] != '\0') {
-@@ -574,7 +574,7 @@ main (int argc, char **argv)
-       } else {
-          struct ARGUS_INPUT addrbuf, *addr = &addrbuf;
- 
--         bzero ((char *) addr, sizeof (*addr));
-+         memset ((char *) addr, 0, sizeof (*addr));
-          addr->fd = 0;
- 
-          if (((ArgusReadConnection (addr, NULL)) >= 0)) {
-@@ -628,8 +628,8 @@ ArgusHandleDatum (struct ArgusRecord *pt
-       u_char buf[MAXSTRLEN];
- 
-       totalrecords++;
--      bcopy ((char *)ptr, (char *)ArgusOriginal, len);
--      bcopy ((char *)ptr, (char *)&buf, len);
-+      memmove ((char *)ArgusOriginal, (char *)ptr, len);
-+      memmove ((char *)&buf, (char *)ptr, len);
-    
-       switch (ptr->ahdr.type) {
-          case ARGUS_MAR:
-@@ -736,68 +736,68 @@ ArgusGenerateCanonicalRecord (struct Arg
- 
-    hdrs = ArgusThisFarHdrs;
- 
--   bzero ((char *)canon, sizeof(*canon));
-+   memset ((char *)canon, 0, sizeof(*canon));
- 
-    if (ptr->ahdr.type & ARGUS_MAR) {
--      bcopy ((char *)ptr, (char *)canon, sizeof(*ptr));
-+      memmove ((char *)canon, (char *)ptr, sizeof(*ptr));
- 
-    } else {
--      bcopy ((char *)&ptr->ahdr, (char *)&canon->ahdr, sizeof(canon->ahdr));
-+      memmove ((char *)&canon->ahdr, (char *)&ptr->ahdr, sizeof(canon->ahdr));
-    
-       for (i = 1; i < 33; i++) {
-          index = 1 << (i - 1);
-          switch (index) {
-             case ARGUS_FAR_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_FAR_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_FAR_DSR_INDEX], (char *)&ar->argus_far, sizeof (ar->argus_far));
-+                  memmove((char *)&ar->argus_far, (char *) hdrs[ARGUS_FAR_DSR_INDEX], sizeof (ar->argus_far));
-                break;
-             case ARGUS_MAC_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_MAC_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_MAC_DSR_INDEX], (char *)&canon->mac, sizeof(canon->mac));
-+                  memmove((char *)&canon->mac, (char *) hdrs[ARGUS_MAC_DSR_INDEX], sizeof(canon->mac));
-                break;
-             case ARGUS_VLAN_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_VLAN_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_VLAN_DSR_INDEX], (char *)&canon->vlan, sizeof(canon->vlan));
-+                  memmove((char *)&canon->vlan, (char *) hdrs[ARGUS_VLAN_DSR_INDEX], sizeof(canon->vlan));
-                break;
-             case ARGUS_MPLS_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_MPLS_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_MPLS_DSR_INDEX], (char *)&canon->mpls, sizeof(canon->mpls));
-+                  memmove((char *)&canon->mpls, (char *) hdrs[ARGUS_MPLS_DSR_INDEX], sizeof(canon->mpls));
-                break;
-             case ARGUS_AGR_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_AGR_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_AGR_DSR_INDEX], (char *)&canon->agr, sizeof(canon->agr));
-+                  memmove((char *)&canon->agr, (char *) hdrs[ARGUS_AGR_DSR_INDEX], sizeof(canon->agr));
-                break;
-             case ARGUS_TIME_DSR_STATUS:
-                if (ArgusThisFarStatus & ARGUS_TIME_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_TIME_DSR_INDEX], (char *)&canon->time, sizeof(canon->time));
-+                  memmove((char *)&canon->time, (char *) hdrs[ARGUS_TIME_DSR_INDEX], sizeof(canon->time));
-                break;
-             case ARGUS_TCP_DSR_STATUS:   
-                if (ArgusThisFarStatus & ARGUS_TCP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_TCP_DSR_INDEX], (char *)&canon->acr_tcp, sizeof(canon->acr_tcp));
-+                  memmove((char *)&canon->acr_tcp, (char *) hdrs[ARGUS_TCP_DSR_INDEX], sizeof(canon->acr_tcp));
-                break;
-             case ARGUS_ICMP_DSR_STATUS:  
-                if (ArgusThisFarStatus & ARGUS_ICMP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_ICMP_DSR_INDEX], (char *)&canon->acr_icmp, sizeof(canon->acr_icmp));
-+                  memmove((char *)&canon->acr_icmp, (char *) hdrs[ARGUS_ICMP_DSR_INDEX], sizeof(canon->acr_icmp));
-                break;
-             case ARGUS_RTP_DSR_STATUS:   
-                if (ArgusThisFarStatus & ARGUS_RTP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_RTP_DSR_INDEX], (char *)&canon->acr_rtp, sizeof(canon->acr_rtp));
-+                  memmove((char *)&canon->acr_rtp, (char *) hdrs[ARGUS_RTP_DSR_INDEX], sizeof(canon->acr_rtp));
-                break;
-             case ARGUS_IGMP_DSR_STATUS:  
-                if (ArgusThisFarStatus & ARGUS_IGMP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_IGMP_DSR_INDEX], (char *)&canon->acr_igmp, sizeof(canon->acr_igmp));
-+                  memmove((char *)&canon->acr_igmp, (char *) hdrs[ARGUS_IGMP_DSR_INDEX], sizeof(canon->acr_igmp));
-                break;
-             case ARGUS_ARP_DSR_STATUS:   
-                if (ArgusThisFarStatus & ARGUS_ARP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_ARP_DSR_INDEX], (char *)&canon->acr_arp, sizeof(canon->acr_arp));
-+                  memmove((char *)&canon->acr_arp, (char *) hdrs[ARGUS_ARP_DSR_INDEX], sizeof(canon->acr_arp));
-                break;
-             case ARGUS_FRG_DSR_STATUS:   
-                if (ArgusThisFarStatus & ARGUS_FRG_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_FRG_DSR_INDEX], (char *)&canon->acr_frag, sizeof(canon->acr_frag));
-+                  memmove((char *)&canon->acr_frag, (char *) hdrs[ARGUS_FRG_DSR_INDEX], sizeof(canon->acr_frag));
-                break;
-             case ARGUS_ESP_DSR_STATUS:   
-                if (ArgusThisFarStatus & ARGUS_ESP_DSR_STATUS)
--                  bcopy((char *) hdrs[ARGUS_ESP_DSR_INDEX], (char *)&canon->acr_esp, sizeof(canon->acr_esp));
-+                  memmove((char *)&canon->acr_esp, (char *) hdrs[ARGUS_ESP_DSR_INDEX], sizeof(canon->acr_esp));
-                break;
-          }
-       }
-@@ -829,7 +829,7 @@ ArgusParseCiscoRecordV1 (u_char **ptr)
-    struct ArgusRecord *argus = ArgusNetFlowArgusRecord;
-    struct ArgusMacStruct mac;
- 
--   bzero ((char *) argus, sizeof (*argus));
-+   memset ((char *) argus, 0, sizeof (*argus));
-    argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-    argus->ahdr.cause   = ARGUS_STATUS;
-    argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -868,7 +868,7 @@ ArgusParseCiscoRecordV1 (u_char **ptr)
-       case IPPROTO_TCP: { 
-          struct ArgusTCPObject tcpbuf, *tcp = &tcpbuf;
- 
--         bzero ((char *) tcp, sizeof(*tcp));
-+         memset ((char *) tcp, 0, sizeof(*tcp));
-          tcp->type = ARGUS_TCP_DSR;
-          tcp->length = sizeof(struct ArgusTCPObject);
-          tcp->src.flags    = entryPtrV1->flags;
-@@ -888,7 +888,7 @@ ArgusParseCiscoRecordV1 (u_char **ptr)
-                break;
-          }
- 
--         bcopy ((char *)tcp, &((char *)argus)[argus->ahdr.length], sizeof(*tcp));
-+         memmove (&((char *)argus)[argus->ahdr.length], (char *)tcp, sizeof(*tcp));
-          argus->ahdr.length += sizeof(*tcp);
-       }
- 
-@@ -906,17 +906,17 @@ ArgusParseCiscoRecordV1 (u_char **ptr)
-       break;
-    }
- 
--   bzero ((char *)&mac, sizeof (mac));
-+   memset ((char *)&mac, 0, sizeof (mac));
-    mac.type   = ARGUS_MAC_DSR;
-    mac.length = sizeof(mac);
-    mac.status = 0;
-    entryPtrV1->input = ntohs(entryPtrV1->input);
-    entryPtrV1->output = ntohs(entryPtrV1->output);
-    
--   bcopy((char *)&entryPtrV1->input, (char *)&mac.phys_union.ether.ethersrc[4], 2);
--   bcopy((char *)&entryPtrV1->output,(char *)&mac.phys_union.ether.etherdst[4], 2);
-+   memmove((char *)&mac.phys_union.ether.ethersrc[4], (char *)&entryPtrV1->input, 2);
-+   memmove((char *)&mac.phys_union.ether.etherdst[4], (char *)&entryPtrV1->output, 2);
- 
--   bcopy ((char *)&mac, &((char *)argus)[argus->ahdr.length], sizeof(mac));
-+   memmove (&((char *)argus)[argus->ahdr.length], (char *)&mac, sizeof(mac));
-    argus->ahdr.length += sizeof(mac);
- 
- #ifdef _LITTLE_ENDIAN
-@@ -939,7 +939,7 @@ ArgusParseCiscoRecordV5 (u_char **ptr)
-    struct ArgusRecord *argus = ArgusNetFlowArgusRecord;
-    struct ArgusMacStruct mac;
- 
--   bzero ((char *) argus, sizeof (*argus));
-+   memset ((char *) argus, 0, sizeof (*argus));
-    argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-    argus->ahdr.cause   = ARGUS_STATUS;
-    argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -980,7 +980,7 @@ ArgusParseCiscoRecordV5 (u_char **ptr)
-       case IPPROTO_TCP: {
-          struct ArgusTCPObject tcpbuf, *tcp = &tcpbuf;
- 
--         bzero ((char *) tcp, sizeof(*tcp));
-+         memset ((char *) tcp, 0, sizeof(*tcp));
-          tcp->type = ARGUS_TCP_DSR;
-          tcp->length = sizeof(struct ArgusTCPObject);
-          tcp->src.flags    = entryPtrV5->tcp_flags;
-@@ -1000,23 +1000,23 @@ ArgusParseCiscoRecordV5 (u_char **ptr)
-                break;
-          }
- 
--         bcopy ((char *)tcp, &((char *)argus)[argus->ahdr.length], sizeof(*tcp));
-+         memmove (&((char *)argus)[argus->ahdr.length], (char *)tcp, sizeof(*tcp));
-          argus->ahdr.length += sizeof(*tcp);
-       }
-       break;
-    }
- 
--   bzero ((char *)&mac, sizeof (mac));
-+   memset ((char *)&mac, 0, sizeof (mac));
-    mac.type   = ARGUS_MAC_DSR;
-    mac.length = sizeof(mac);
-    mac.status = 0;
-    entryPtrV5->input = ntohs(entryPtrV5->input);
-    entryPtrV5->output = ntohs(entryPtrV5->output);
- 
--   bcopy((char *)&entryPtrV5->input, (char *)&mac.phys_union.ether.ethersrc[4], 2);
--   bcopy((char *)&entryPtrV5->output,(char *)&mac.phys_union.ether.etherdst[4], 2);
-+   memmve((char *)&mac.phys_union.ether.ethersrc[4], (char *)&entryPtrV5->input, 2);
-+   memmove((char *)&mac.phys_union.ether.etherdst[4], (char *)&entryPtrV5->output, 2);
- 
--   bcopy ((char *)&mac, &((char *)argus)[argus->ahdr.length], sizeof(mac));
-+   memmove (&((char *)argus)[argus->ahdr.length], (char *)&mac, sizeof(mac));
-    argus->ahdr.length += sizeof(mac);
- 
- #ifdef _LITTLE_ENDIAN
-@@ -1039,7 +1039,7 @@ ArgusParseCiscoRecordV6 (u_char **ptr)
-    struct ArgusRecord *argus = ArgusNetFlowArgusRecord;
-    struct ArgusMacStruct mac;
- 
--   bzero ((char *) argus, sizeof (*argus));
-+   memset ((char *) argus, 0, sizeof (*argus));
-    argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-    argus->ahdr.cause   = ARGUS_STATUS;
-    argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -1080,7 +1080,7 @@ ArgusParseCiscoRecordV6 (u_char **ptr)
-       case IPPROTO_TCP: {
-          struct ArgusTCPObject tcpbuf, *tcp = &tcpbuf;
- 
--         bzero ((char *) tcp, sizeof(*tcp));
-+         memset ((char *) tcp, 0, sizeof(*tcp));
-          tcp->type = ARGUS_TCP_DSR;
-          tcp->length = sizeof(struct ArgusTCPObject);
-          tcp->src.flags    = entryPtrV6->tcp_flags;
-@@ -1100,23 +1100,23 @@ ArgusParseCiscoRecordV6 (u_char **ptr)
-                break;
-          }
- 
--         bcopy ((char *)tcp, &((char *)argus)[argus->ahdr.length], sizeof(*tcp));
-+         memmve (&((char *)argus)[argus->ahdr.length], (char *)tcp, sizeof(*tcp));
-          argus->ahdr.length += sizeof(*tcp);
-       }
-       break;
-    }
- 
--   bzero ((char *)&mac, sizeof (mac));
-+   memset ((char *)&mac, 0, sizeof (mac));
-    mac.type   = ARGUS_MAC_DSR;
-    mac.length = sizeof(mac);
-    mac.status = 0;
-    entryPtrV6->input = ntohs(entryPtrV6->input);
-    entryPtrV6->output = ntohs(entryPtrV6->output);
- 
--   bcopy((char *)&entryPtrV6->input, (char *)&mac.phys_union.ether.ethersrc[4], 2);
--   bcopy((char *)&entryPtrV6->output,(char *)&mac.phys_union.ether.etherdst[4], 2);
-+   memmove((char *)&mac.phys_union.ether.ethersrc[4], (char *)&entryPtrV6->input, 2);
-+   memmove((char *)&mac.phys_union.ether.etherdst[4], (char *)&entryPtrV6->output, 2);
- 
--   bcopy ((char *)&mac, &((char *)argus)[argus->ahdr.length], sizeof(mac));
-+   memmove (&((char *)argus)[argus->ahdr.length], (char *)&mac, sizeof(mac));
-    argus->ahdr.length += sizeof(mac);
- 
- #ifdef _LITTLE_ENDIAN
-@@ -1145,7 +1145,7 @@ ArgusParseCiscoRecord (u_char **ptr)
-          CiscoFlowHeaderV1_t *hdrPtrV1   = (CiscoFlowHeaderV1_t *) *ptr;
-          CiscoFlowEntryV1_t  *entryPtrV1 = (CiscoFlowEntryV1_t *) (hdrPtrV1 + 1);
- 
--         bzero ((char *) argus, sizeof (*argus));
-+         memset ((char *) argus, 0, sizeof (*argus));
-          argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-          argus->ahdr.cause   = ARGUS_STATUS;
-          argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -1191,7 +1191,7 @@ ArgusParseCiscoRecord (u_char **ptr)
-          CiscoFlowHeaderV5_t *hdrPtrV5   = (CiscoFlowHeaderV5_t *) ptr;
-          CiscoFlowEntryV5_t  *entryPtrV5 = (CiscoFlowEntryV5_t *) (hdrPtrV5 + 1);
- 
--         bzero ((char *) argus, sizeof (*argus));
-+         memset ((char *) argus, 0, sizeof (*argus));
-          argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-          argus->ahdr.cause   = ARGUS_STATUS;
-          argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -1238,7 +1238,7 @@ ArgusParseCiscoRecord (u_char **ptr)
-          CiscoFlowHeaderV6_t *hdrPtrV6   = (CiscoFlowHeaderV6_t *) ptr;
-          CiscoFlowEntryV6_t  *entryPtrV6 = (CiscoFlowEntryV6_t *) (hdrPtrV6 + 1);
- 
--         bzero ((char *) argus, sizeof (*argus));
-+         memset ((char *) argus, 0, sizeof (*argus));
-          argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-          argus->ahdr.cause   = ARGUS_STATUS;
-          argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -1301,7 +1301,7 @@ ArgusNetFlowCallRecord (u_char **ptr)
-    BinaryRecord_CallRecord_V1 *call = (BinaryRecord_CallRecord_V1 *) *ptr;
- 
-    if (*ptr) {
--      bzero ((char *) argus, sizeof (*argus));
-+      memset ((char *) argus, 0, sizeof (*argus));
-       argus->ahdr.type    = ARGUS_FAR | ARGUS_CISCO_NETFLOW;
-       argus->ahdr.cause   = ARGUS_STATUS;
-       argus->ahdr.length  = sizeof(argus->ahdr) + sizeof(argus->argus_far);
-@@ -1348,7 +1348,7 @@ ArgusNetFlowDetailInt (u_char **ptr)
- 
-    if (*ptr) {
-       dint = NULL;
--      bzero ((char *) argus, sizeof (*argus));
-+      memset ((char *) argus, 0, sizeof (*argus));
-    }
- 
- 
-@@ -1438,7 +1438,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
- 
-    if (fd >= 0) {
-       if (!(Cflag)) {
--         bzero ((char *) &argus, sizeof(argus));
-+         memset ((char *) &argus, 0, sizeof(argus));
-          if ((cnt = read (fd, &argus, sizeof(argus.ahdr))) == sizeof(argus.ahdr)) {
- #ifdef ARGUSDEBUG
-             ArgusDebug (5, "ArgusReadConnection() read %d bytes\n", cnt);
-@@ -1447,7 +1447,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                if (((ptr[0] == 0x1F) && ((ptr[1] == 0x8B) || (ptr[1] == 0x9D))) ||
-                    ((ptr[0] == 'B') && (ptr[1] == 'Z') && (ptr[2] == 'h'))) {
-                   char cmd[256];
--                  bzero(cmd, 256);
-+                  memset(cmd, 0, 256);
-                   close(fd);
-                   if (ptr[0] == 'B')
-                      strcpy(cmd, "bzip2 -dc ");
-@@ -1514,8 +1514,8 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                         return (-1);
-                      }
-       
--                     bcopy ((char *) &argus, (char *)&input->ArgusInitCon, sizeof (argus));
--                     bcopy ((char *) &argus, (char *) ArgusOriginal, length);
-+                     memmove ((char *)&input->ArgusInitCon, (char *) &argus, sizeof (argus));
-+                     memmove ((char *) ArgusOriginal, (char *) &argus, length);
-                      ArgusInput = input;
-       
-                      ArgusHandleDatum ((struct ArgusRecord *)&argus, &ArgusFilterCode);
-@@ -1524,7 +1524,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                      ArgusNtoH(&argus);
- #endif
-       
--                     bcopy ((char *) &argus, (char *)&input->ArgusManStart, sizeof (argus));
-+                     memmove ((char *)&input->ArgusManStart, (char *) &argus, sizeof (argus));
-                      input->major_version = MAJOR_VERSION_2;
-                      input->minor_version = MINOR_VERSION_0;
-                      input->ArgusReadSize = argus.argus_mar.record_len;
-@@ -1543,7 +1543,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                         if ((ArgusRemoteFilter != NULL) && (filename == NULL) && (fd != 0)) {
-                            int len;
- 
--                           bzero(buf, MAXSTRLEN);
-+                           memset(buf, 0, MAXSTRLEN);
-                            snprintf ((char *) buf, MAXSTRLEN-1, "FILTER: man or %s", (char *) ArgusRemoteFilter);
-                            len = strlen((char *) buf);
-                            if (ArgusWriteConnection (input, buf, len) < 0) {
-@@ -1564,7 +1564,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                   char *ptr;
-                   int size;
-    
--                  bcopy ((char *)&argus, buf, sizeof(argus.ahdr));
-+                  memmove (buf, (char *)&argus, sizeof(argus.ahdr));
- 
-                   size = sizeof(*ws) - sizeof(argus.ahdr);
-    
-@@ -1584,11 +1584,11 @@ ArgusReadConnection (struct ARGUS_INPUT 
- 
-                      if (initCon == NULL) {
-                         if ((initCon = (struct ArgusRecord *) calloc (1, sizeof (argus))) != NULL)
--                           bcopy ((char *) &argus, (char *) initCon, sizeof (argus));
-+                           memmove ((char *) initCon, (char *) &argus, sizeof (argus));
-                      }
- 
--                     bcopy ((char *) &argus, (char *)&input->ArgusInitCon, sizeof (argus));
--                     bcopy ((char *)&argus, (char *) ArgusOriginal, sizeof(argus));
-+                     memmove ((char *)&input->ArgusInitCon, (char *) &argus, sizeof (argus));
-+                     memmove ((char *) ArgusOriginal, (char *)&argus, sizeof(argus));
- 
-                      ArgusInput = input;
- 
-@@ -1617,7 +1617,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                   BinaryHeaderF2 *ArgusNetFlow = (BinaryHeaderF2 *) buf;
-                   int size;
-    
--                  bcopy ((char *)&argus, buf, sizeof(argus.ahdr));
-+                  memmove (buf, (char *)&argus, sizeof(argus.ahdr));
-                   size = sizeof(*ArgusNetFlow) - sizeof(argus.ahdr);
-    
-                   if ((cnt = read (fd, &buf[sizeof(argus.ahdr)], size)) != size) {
-@@ -1633,7 +1633,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
-                      ArgusNetFlow->missed    = ntohl(ArgusNetFlow->missed);
-                      ArgusNetFlow->records   = ntohl(ArgusNetFlow->records);
- #endif
--                     bzero ((char *)&argus, sizeof(argus));
-+                     memset ((char *)&argus, 0, sizeof(argus));
-    
-                      argus.ahdr.type                 = ARGUS_MAR | ARGUS_CISCO_NETFLOW;
-                      argus.ahdr.length               = sizeof (argus);
-@@ -1657,11 +1657,11 @@ ArgusReadConnection (struct ARGUS_INPUT 
- #endif
-                         if (initCon == NULL) {
-                            if ((initCon = (struct ArgusRecord *) calloc (1, sizeof (argus))) != NULL)
--                              bcopy ((char *) &argus, (char *) initCon, sizeof (argus));
-+                              memmove ((char *) initCon, (char *) &argus, sizeof (argus));
-                         }
- 
--                        bcopy ((char *) &argus, (char *)&input->ArgusInitCon, sizeof (argus));
--                        bcopy ((char *) &argus, (char *) ArgusOriginal, sizeof(argus));
-+                        memmove ((char *)&input->ArgusInitCon, (char *) &argus, sizeof (argus));
-+                        memmove ((char *) ArgusOriginal, (char *) &argus, sizeof(argus));
-                         ArgusInput = input;
- 
-                         ArgusGenerateCanonicalRecord (&argus, canon);
-@@ -1702,7 +1702,7 @@ ArgusReadConnection (struct ARGUS_INPUT 
- #ifdef ARGUSDEBUG
-             ArgusDebug (2, "ArgusReadConnection(0x%x) reading from Cisco Router.\n", input);
- #endif
--            bzero ((char *)&argus, sizeof(argus));
-+            memset ((char *)&argus, 0, sizeof(argus));
-             argus_parse_init (input);
-          }
-       }
-@@ -1902,7 +1902,7 @@ ArgusReadSaslStreamSocket (struct ARGUS_
- 
-                while ((char *)argus < end) {
-                   input->ArgusReadSocketCnt = ntohs(argus->ahdr.length);
--                  bcopy (argus, input->ArgusReadBuffer, input->ArgusReadSocketCnt);
-+                  memmove (input->ArgusReadBuffer, argus, input->ArgusReadSocketCnt);
- 
-                   if (ArgusHandleDatum (argus, &ArgusFilterCode) == 1) {
-                      if (!input->filename)
-@@ -1970,7 +1970,7 @@ ArgusReadStreamSocket (struct ARGUS_INPU
-          if (input->ArgusReadSocketState == ARGUS_READINGHDR) {
-             input->ArgusReadSocketState = ARGUS_READINGBLOCK;
-             
--            bcopy ((char *) &((struct ArgusRecordHeader *)input->ArgusReadPtr)->length, (char *) &length, sizeof(length));
-+            memmove ((char *) &length, (char *) &((struct ArgusRecordHeader *)input->ArgusReadPtr)->length, sizeof(length));
-             input->ArgusReadSocketSize = ntohs(length) - sizeof(struct ArgusRecordHeader);
-             if ((input->ArgusReadSocketSize > 0) && (input->ArgusReadSocketSize < MAXSTRLEN)) {
-                input->ArgusReadPtr = &input->ArgusReadBuffer[input->ArgusReadSocketCnt];
-@@ -1986,7 +1986,7 @@ ArgusReadStreamSocket (struct ARGUS_INPU
-             if (input->major_version < 2) {
-                ArgusConvertWriteStruct ((struct WriteStruct *)input->ArgusReadBuffer,
-                                         (struct ArgusRecord *)input->ArgusConvBuffer);
--               bcopy ((char *) input->ArgusConvBuffer, input->ArgusReadBuffer, MAXSTRLEN);
-+               memmove (input->ArgusReadBuffer, (char *) input->ArgusConvBuffer, MAXSTRLEN);
-             }
- 
-             if (ArgusHandleDatum ((struct ArgusRecord *)input->ArgusReadBuffer, &ArgusFilterCode) == 1) {
-@@ -2002,7 +2002,7 @@ ArgusReadStreamSocket (struct ARGUS_INPU
-             }
- 
-             input->ArgusReadPtr = input->ArgusReadBuffer;
--            bzero (input->ArgusReadBuffer, MAXSTRLEN);
-+            memset (input->ArgusReadBuffer, 0, MAXSTRLEN);
-             input->ArgusReadSocketCnt = 0;
-          }
-       }
-@@ -2105,7 +2105,7 @@ ArgusReadCiscoStreamSocket (struct ARGUS
- 
-                if (!(input->ArgusReadSocketNum--)) {
-                   input->ArgusReadPtr = input->ArgusReadBuffer;
--                  bzero (input->ArgusReadBuffer, MAXSTRLEN);
-+                  memset (input->ArgusReadBuffer, 0, MAXSTRLEN);
- 
-                } else {
-                   input->ArgusReadPtr = input->ArgusReadBlockPtr;
-@@ -2279,7 +2279,7 @@ ArgusReadStream ()
-       return;
-    }
- 
--   bzero ((char *)&timeoutValue, sizeof(timeoutValue));
-+   memset ((char *)&timeoutValue, 0, sizeof(timeoutValue));
- 
-    if (gettimeofday (&now, NULL) == 0) {
-       ArgusAdjustGlobalTime(&ArgusGlobalTime, &ArgusNowTime);
-@@ -2535,7 +2535,7 @@ ArgusGetServerSocket (struct ARGUS_INPUT
-          } else
-             portnum = htons(input->portnum);
- 
--         bzero ((char *)&argus, sizeof(argus));
-+         memset ((char *)&argus, 0, sizeof(argus));
-          argus.ahdr.type                 = ARGUS_MAR | ARGUS_CISCO_NETFLOW;
-          argus.ahdr.length               = sizeof (argus);
-          argus.ahdr.cause                = ARGUS_START;
-@@ -2549,15 +2549,15 @@ ArgusGetServerSocket (struct ARGUS_INPUT
-          input->major_version = argus.argus_mar.major_version;
-          input->minor_version = argus.argus_mar.minor_version;
- 
--         bcopy ((char *) &argus, (char *)&input->ArgusInitCon, sizeof (argus));
--         bcopy ((char *) &argus, (char *) ArgusOriginal, sizeof(argus));
-+         memmove ((char *)&input->ArgusInitCon, (char *) &argus, sizeof (argus));
-+         memmove ((char *) ArgusOriginal, (char *) &argus, sizeof(argus));
-          ArgusInput = input;
- 
-       } else
-          ArgusLog (LOG_ERR, "ArgusGetServerSocket(0x%x) unknown type\n", input);
-    }
- 
--   bzero ((char *) &server, sizeof (server));
-+   memset ((char *) &server, 0, sizeof (server));
- 
-    if ((s = socket (AF_INET, type, 0)) >= 0) {
-       if (type == SOCK_DGRAM) {
-@@ -2582,7 +2582,7 @@ ArgusGetServerSocket (struct ARGUS_INPUT
- 
-          if ((hp = gethostbyaddr ((char *)&input->addr, sizeof (input->addr), AF_INET)) != NULL) {
-             input->hostname = strdup(hp->h_name);
--            bcopy ((char *) hp->h_addr, (char *)&server.sin_addr, hp->h_length);
-+            memmove ((char *)&server.sin_addr, (char *) hp->h_addr, hp->h_length);
-             server.sin_family = hp->h_addrtype;
-             server.sin_port = portnum;
- #ifdef ARGUSDEBUG
-@@ -2889,7 +2889,7 @@ check_time (struct ArgusRecord *ptr)
-       if (!explicit_date) {
-          tm = localtime_r((time_t *)&start->tv_sec, &tmbuf);
-          if (tm->tm_yday != starTimeFilter.tm_yday) {
--            bcopy ((char *) tm, (char *) &tmbuf, sizeof (struct tm));
-+            memmove ((char *) &tmbuf, (char *) tm, sizeof (struct tm));
-             if (check_time_format (&tmbuf, timearg))
-                ArgusLog (LOG_ERR, "time syntax error %s\n", timearg);
-          }
-@@ -2926,7 +2926,7 @@ parseUserDataArg (char **arg, char *args
-    int retn = -1;
-    char buf[64], *ptr = buf;
-    
--   bzero (buf, 64);
-+   memset (buf, 0, 64);
-    strcpy (buf, *arg);
-    ptr += strlen (buf);
- 
-@@ -2992,7 +2992,7 @@ parseTimeArg ( char **arg, char *args[],
-    int retn = -1;
-    char buf[64], *ptr = buf;
- 
--   bzero (buf, 64);
-+   memset (buf, 0, 64);
-    strcpy (buf, *arg);
-    ptr += strlen (buf);
-    if ((ptr = strchr(*arg, '-')) && (*(ptr + 1) != '\0')) {
-@@ -3054,7 +3054,7 @@ check_time_format (struct tm *tm, char *
- 
-    } else {
-       if ((retn = parseTime (&starTimeFilter, tm, buf)) > 0) {
--         bcopy ((char *)&starTimeFilter, (char *)&lastTimeFilter, sizeof(struct tm));
-+         memmove ((char *)&lastTimeFilter, (char *)&starTimeFilter, sizeof(struct tm));
-          switch (retn) {
-             case ARGUS_YEAR:  lastTimeFilter.tm_year++; break;
-             case ARGUS_MONTH: lastTimeFilter.tm_mon++; break;
-@@ -3091,7 +3091,7 @@ parseTime (struct tm *tm, struct tm *ctm
- 
-    /*[[[yyyy/]mm/]dd].]hh[:mm[:ss]]*/
- 
--   bcopy ((u_char *) ctm, (u_char *) tm, sizeof (struct tm));
-+   memmove ((u_char *) tm, (u_char *) ctm, sizeof (struct tm));
- 
-    if ((hptr = strchr (str, '.')) != NULL) {
-       *hptr++ = '\0';
-diff -rup argus-3.0.0.rc.34.orig/common/argus_util.c argus-3.0.0.rc.34/common/argus_util.c
---- argus-3.0.0.rc.34.orig/common/argus_util.c	2006-10-02 17:23:44.000000000 +0200
-+++ argus-3.0.0.rc.34/common/argus_util.c	2006-12-20 17:02:40.000000000 +0100
-@@ -540,12 +540,12 @@ ArgusNtoH (struct ArgusRecord *argus)
-                   u_int32_t value;
-                   stat->n        = ntohl(stat->n);
-                   stat->minval   = ntohl(stat->minval);
--                  bcopy((char *)&stat->meanval, (char *)&value, sizeof(value));
-+                  memmove((char *)&value, (char *)&stat->meanval, sizeof(value));
-                   value          = ntohl(value);
--                  bcopy((char *)&value, (char *)&stat->meanval, sizeof(value));
--                  bcopy((char *)&stat->stdev, (char *)&value, sizeof(value));
-+                  memmove((char *)&stat->meanval, (char *)&value, sizeof(value));
-+                  memmove((char *)&value, (char *)&stat->stdev, sizeof(value));
-                   value          = ntohl(value);
--                  bcopy((char *)&value, (char *)&stat->stdev, sizeof(value));
-+                  memmove((char *)&stat->stdev, (char *)&value, sizeof(value));
-                   stat->maxval   = ntohl(stat->maxval);
- 
-                   stat++;
-@@ -946,12 +946,12 @@ ArgusHtoN (struct ArgusRecord *argus)
-                   u_int32_t value;
-                   stat->n        = htonl(stat->n);
-                   stat->minval   = htonl(stat->minval);
--                  bcopy((char *)&stat->meanval, (char *)&value, sizeof(value));
-+                  memmove((char *)&value, (char *)&stat->meanval, sizeof(value));
-                   value          = htonl(value);
--                  bcopy((char *)&value, (char *)&stat->meanval, sizeof(value));
--                  bcopy((char *)&stat->stdev, (char *)&value, sizeof(value));
-+                  memmove((char *)&stat->meanval, (char *)&value, sizeof(value));
-+                  memmove((char *)&value, (char *)&stat->stdev, sizeof(value));
-                   value          = htonl(value);
--                  bcopy((char *)&value, (char *)&stat->stdev, sizeof(value));
-+                  memmove((char *)&stat->stdev, (char *)&value, sizeof(value));
-                   stat->maxval   = htonl(stat->maxval);
-                   stat++;
-                   len -= sizeof (*stat);
-@@ -1535,8 +1535,8 @@ print_time(struct timeval *tvp)
-    char *retn = ArgusPrintTimeBuf, *ptr;
-    struct tm *tm, tmbuf;
- 
--   bzero (timeZoneBuf, sizeof(timeZoneBuf));
--   bzero (ArgusPrintTimeBuf, sizeof(ArgusPrintTimeBuf));
-+   memset (timeZoneBuf, 0, sizeof(timeZoneBuf));
-+   memset (ArgusPrintTimeBuf, 0, sizeof(ArgusPrintTimeBuf));
- 
-    if ((tm = localtime_r ((time_t *)&tvp->tv_sec, &tmbuf)) != NULL) {
-       if (uflag)
-@@ -1614,8 +1614,8 @@ lookup_nsap(struct ArgusParserStruct *pa
-           tp->e_addr1 == j &&
-           tp->e_addr2 == k &&
-           tp->e_nsap[0] == nlen &&
--          bcmp((char *)&(nsap[1]),
--         (char *)&(tp->e_nsap[1]), nlen) == 0)
-+          ( nlen == 0 ? 0 : memcmp((char *)&(nsap[1]),
-+         (char *)&(tp->e_nsap[1]), nlen) == 0))
-          return tp;
-       else
-          tp = tp->e_nxt;
-@@ -1623,7 +1623,7 @@ lookup_nsap(struct ArgusParserStruct *pa
-    tp->e_addr1 = j;
-    tp->e_addr2 = k;
-    tp->e_nsap = (u_char *) calloc(1, nlen + 1);
--   bcopy(nsap, tp->e_nsap, nlen + 1);
-+   memmove(tp->e_nsap, nsap, nlen + 1);
-    tp->e_nxt = (struct enamemem *)calloc(1, sizeof(*tp));
- 
-    return tp;
-@@ -1696,7 +1696,7 @@ ArgusInitEprotoarray(struct ArgusParserS
- {
-    struct ArgusEtherTypeStruct *p = argus_ethertype_names;
- 
--   bzero ((char *)parser->argus_eproto_db, sizeof (parser->argus_eproto_db));
-+   memset ((char *)parser->argus_eproto_db, 0, sizeof (parser->argus_eproto_db));
- 
-    while (p->range != NULL) {
-       int i, start, end;
-@@ -2209,7 +2209,7 @@ etheraddr_string(u_char *ep)
-    char *cp = etheraddrbuf;
-    u_int i, j;
- 
--   bzero (cp, sizeof(etheraddrbuf));
-+   memset (cp, 0, sizeof(etheraddrbuf));
-    if ((j = *ep >> 4) != 0)
-       *cp++ = hex[j];
-    *cp++ = hex[*ep++ & 0xf];
diff --git a/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch b/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch
deleted file mode 100644
index 2060c93..0000000
--- a/package/argus/argus-3.0.0.rc.34-01-use-pcap-header.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Instead of hardcoding a wrong prototype for a libcap function, include
-the correct header.
-
-Index: argus-3.0.0.rc.34/argus/ArgusSource.c
-===================================================================
---- argus-3.0.0.rc.34.orig/argus/ArgusSource.c	2010-02-09 22:57:21.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusSource.c	2010-02-09 22:57:29.000000000 +0100
-@@ -53,6 +53,7 @@
- #define PPP_HDRLEN      4       /* length of PPP header */
- #endif
- 
-+#include <pcap.h>
- 
- void ArgusGetInterfaceStatus (struct ArgusSourceStruct *src);
- 
-Index: argus-3.0.0.rc.34/argus/ArgusSource.h
-===================================================================
---- argus-3.0.0.rc.34.orig/argus/ArgusSource.h	2010-02-09 22:57:35.000000000 +0100
-+++ argus-3.0.0.rc.34/argus/ArgusSource.h	2010-02-09 22:57:54.000000000 +0100
-@@ -381,7 +381,6 @@
- 
- int ArgusCreatePktFromFddi(const struct fddi_header *, struct ether_header *, int);
- 
--extern char *bpf_image(struct bpf_insn *, int);
- 
- 
- #else /* defined(ArgusSource) */
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index f169506..7d36cde 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-ARGUS_VERSION = 3.0.0.rc.34
-ARGUS_SOURCE = argus_$(ARGUS_VERSION).orig.tar.gz
-ARGUS_PATCH = argus_$(ARGUS_VERSION)-1.diff.gz
-ARGUS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
+ARGUS_VERSION = 3.0.6.1
+ARGUS_SITE = http://qosient.com/argus/src
 ARGUS_DEPENDENCIES = libpcap
+ARGUS_CONF_ENV = arg_cv_sys_errlist=yes
+# Code is really v2+ though COPYING is v3 so ship README to avoid confusion
 ARGUS_LICENSE = GPLv2+
-ARGUS_LICENSE_FILES = COPYING
+ARGUS_LICENSE_FILES = README
 
-define ARGUS_DEBIAN_PATCH_APPLY
-	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
-	fi
-endef
-
-ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+ARGUS_DEPENDENCIES += libtirpc
+ARGUS_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/" \
+	LDFLAGS="$(TARGET_LDFLAGS) -ltirpc"
+endif
 
 $(eval $(autotools-package))
-- 
1.8.5.5
